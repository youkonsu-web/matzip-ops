// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart';

import 'package:cloud_functions/cloud_functions.dart';

Future<dynamic> callGetDirectUpload(
  String folder,
  String? contentType,
) async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  try {
    final functions = FirebaseFunctions.instanceFor(
      region: 'asia-northeast3',
    );

    final callable = functions.httpsCallable('getDirectUpload');

    final Map<String, dynamic> payload = {
      'folder': folder.trim().isEmpty ? 'uploads' : folder.trim(),
    };

    // contentType 있을 때만 넣음
    if (contentType != null && contentType.trim().isNotEmpty) {
      payload['contentType'] = contentType.trim();
    }

    final result = await callable.call(payload);

    final data = result.data;

    if (data == null) {
      return {
        'ok': false,
        'error': 'empty_response',
      };
    }

    if (data is Map) {
      return Map<String, dynamic>.from(data);
    }

    return {
      'ok': false,
      'error': 'invalid_response',
      'raw': data.toString(),
    };
  } on FirebaseFunctionsException catch (e) {
    return {
      'ok': false,
      'error': e.code,
      'message': e.message,
    };
  } catch (e) {
    return {
      'ok': false,
      'error': 'unknown',
      'message': e.toString(),
    };
  }

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
