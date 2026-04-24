import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? cfUrlByVariant(
  String? id,
  String? variant,
  String? fallbackVariant,
) {
  if (id == null) return null;
  final String trimmed = id.trim();
  if (trimmed.isEmpty) return '';

  // ====== R2 / Cloudflare Image Resizing ======
  const String kHostBase = 'https://img.matzipdex.com'; // R2 공개 호스트
  const String kResizeBase =
      'https://img.matzipdex.com/cdn-cgi/image'; // 리사이즈 엔드포인트

  // variant 기본값
  final String fb = (fallbackVariant != null && fallbackVariant.isNotEmpty)
      ? fallbackVariant
      : 'public';
  final String v = (variant == null || variant.isEmpty) ? fb : variant;

  // 리사이즈 옵션
  String _opts(String name) {
    switch (name) {
      case 'main3x4':
        return 'width=900,height=1200,fit=cover,quality=85,format=auto';
      case 'pcard':
        return 'width=375,height=500,fit=cover,quality=85,format=auto';
      case 'pfeed':
        return 'width=600,height=800,fit=cover,quality=85,format=auto';
      case 'phero':
        return 'width=810,height=1080,fit=cover,quality=85,format=auto';
      case 'pthumb':
        return 'width=240,height=320,fit=cover,quality=75,format=auto';
      case 'sqfeed':
        return 'width=720,height=720,fit=cover,quality=85,format=auto';
      case 'sqthumb':
        return 'width=320,height=320,fit=cover,quality=80,format=auto';
      case 'public':
      default:
        return ''; // 원본
    }
  }

  // --- 1) 이미 URL이 들어온 경우 ---
  if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
    // 이미 리사이즈된 URL이면 그대로 반환 (중복 래핑 방지)
    if (trimmed.contains('/cdn-cgi/image/')) return trimmed;

    // 우리 호스트라면 path만 뽑아서 리사이즈 구성
    if (trimmed.startsWith('$kHostBase/')) {
      final String pathOnly =
          trimmed.substring('$kHostBase/'.length); // 'feeds/...'
      final String o = _opts(v);
      return o.isEmpty ? '$kHostBase/$pathOnly' : '$kResizeBase/$o/$pathOnly';
    }

    // R2만 쓴다고 했으므로, 외부 호스트는 그대로 통과
    return trimmed;
  }

  // --- 2) R2 Object Key (예: 'feeds/uid/xxx.jpg') ---
  final String path = trimmed.startsWith('/') ? trimmed.substring(1) : trimmed;
  final String o = _opts(v);
  return o.isEmpty ? '$kHostBase/$path' : '$kResizeBase/$o/$path';
}
