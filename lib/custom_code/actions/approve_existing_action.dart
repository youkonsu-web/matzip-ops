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

Future approveExistingAction(
  DocumentReference candidateRef,
  String restaurantId,
) async {
  final adminEmail = FirebaseAuth.instance.currentUser?.email ?? '';

  final db = FirebaseFirestore.instance;
  final rRef = db.collection('restaurants').doc(restaurantId);

  await db.runTransaction((tx) async {
    tx.update(candidateRef, {
      'status': 'approved_existing',
      'restaurants_ref': rRef,
      'approved_at': FieldValue.serverTimestamp(),
      'approved_by': adminEmail,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  });
}
