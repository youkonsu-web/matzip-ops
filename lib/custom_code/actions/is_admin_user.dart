// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/auth/firebase_auth/auth_util.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> isAdminUser() async {
  final uid = currentUserUid;

  if (uid == null || uid.isEmpty) {
    return false;
  }

  final doc =
      await FirebaseFirestore.instance.collection('admins').doc(uid).get();

  if (!doc.exists) {
    return false;
  }

  final data = doc.data();
  if (data == null) {
    return false;
  }

  // active 필드까지 체크
  return data['active'] == true;
}
