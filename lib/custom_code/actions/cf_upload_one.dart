// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'package:http/http.dart' as http;

/// 업로드 수행 (디버깅 로그 포함):
/// - Cloudflare R2 presigned URL: PUT binary (Content-Type 반드시 presign과 동일)
/// - Cloudflare Images direct_upload: POST multipart(field "file")
/// 성공 시 서버에서 받은 imageId를 그대로 반환
Future<String> cfUploadOne(
  FFUploadedFile file,
  String uploadURL,
  String imageId,
  String contentType, // 서버가 준 값을 그대로 사용
) async {
  // ---- helpers ----
  String _snip(String s, [int max = 220]) {
    if (s.length <= max) return s;
    return s.substring(0, max) + '...<snip>';
  }

  void _log(String msg) {
    // debugPrint는 너무 긴 문자열도 안전하게 출력
    debugPrint('[cfUploadOne] $msg');
  }

  final startedAt = DateTime.now();

  // 0) 파일 바이트 확인
  final Uint8List? bytes = file.bytes;
  if (bytes == null || bytes.isEmpty) {
    throw Exception('[cfUploadOne] Empty file bytes.');
  }

  // 1) URL 파싱 및 R2 여부 판별
  late final Uri uri;
  try {
    uri = Uri.parse(uploadURL);
  } catch (e) {
    throw Exception('[cfUploadOne] Invalid uploadURL: $e');
  }

  final isR2 = uri.queryParameters.containsKey('X-Amz-Signature') ||
      uri.host.contains('r2.cloudflarestorage.com') ||
      uri.host.endsWith('.r2.dev');

  // contentType fallback 방지
  final ct =
      (contentType.isNotEmpty) ? contentType : 'application/octet-stream';

  _log('start '
      '{ fileName="${file.name}", bytes=${bytes.length}, '
      'host=${uri.host}, path=${uri.path}, isR2=$isR2, '
      'contentType="$ct" }');

  try {
    if (isR2) {
      // ---- R2: PUT binary ----
      http.Response resp;
      try {
        resp = await http
            .put(
              uri,
              headers: {'Content-Type': ct},
              body: bytes,
            )
            .timeout(const Duration(minutes: 2));
      } catch (e) {
        throw Exception('R2 upload network error: $e');
      }

      _log('R2 PUT done '
          '{ status=${resp.statusCode}, '
          'etag=${resp.headers['etag']}, '
          'amz-id=${resp.headers['x-amz-request-id']}, '
          'amz-cf-id=${resp.headers['x-amz-cf-id'] ?? resp.headers['cf-ray']}, '
          'body=${_snip(resp.body)} }');

      if (resp.statusCode < 200 || resp.statusCode >= 300) {
        throw Exception(
          'R2 upload failed ${resp.statusCode}: '
          '${_snip(resp.body)}',
        );
      }
    } else {
      // ---- Cloudflare Images: POST multipart (field "file") ----
      final req = http.MultipartRequest('POST', uri);
      req.files.add(
        http.MultipartFile.fromBytes(
          'file',
          bytes,
          filename: file.name ?? 'upload.jpg',
        ),
      );

      http.StreamedResponse streamed;
      try {
        streamed = await req.send().timeout(const Duration(minutes: 2));
      } catch (e) {
        throw Exception('CF Images upload network error: $e');
      }

      final body = await streamed.stream.bytesToString();

      _log('CF Images POST done '
          '{ status=${streamed.statusCode}, '
          'headers=${_snip(streamed.headers.toString())}, '
          'body=${_snip(body)} }');

      // CF Images 정상 응답은 보통 200
      if (streamed.statusCode != 200) {
        throw Exception(
          'CF Images upload failed ${streamed.statusCode}: ${_snip(body)}',
        );
      }
    }
  } catch (e) {
    final ms = DateTime.now().difference(startedAt).inMilliseconds;
    _log('ERROR after ${ms}ms => $e');
    rethrow;
  }

  final ms = DateTime.now().difference(startedAt).inMilliseconds;
  _log('success after ${ms}ms => imageId="$imageId"');

  // 3) 성공 → imageId 그대로 반환 (R2의 경우 object key)
  return imageId;
}
