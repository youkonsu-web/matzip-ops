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
import 'package:firebase_auth/firebase_auth.dart';

Future rejectAction(
  DocumentReference candidateRef,
  String rejectReason,
) async {
  final adminEmail = FirebaseAuth.instance.currentUser?.email ?? '';

  final db = FirebaseFirestore.instance;

  await db.runTransaction((tx) async {
    tx.update(candidateRef, {
      'status': 'rejected',
      'rejected_at': FieldValue.serverTimestamp(),
      'rejected_by': adminEmail,
      'reject_reason': rejectReason,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  });
}
