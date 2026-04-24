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

Future<void> approveNewAction(
  DocumentReference candidateRef,
  PlaceCandidatesRecord candidateData,
  String name,
  String address,
  String category,
  String phone,
  String menu,
  String amenities,
  String placeType,
  String locationStr,
) async {
  final finalName = name.trim().isNotEmpty ? name : (candidateData.name ?? '');
  final finalAddress =
      address.trim().isNotEmpty ? address : (candidateData.address ?? '');
  final finalCategory =
      category.trim().isNotEmpty ? category : (candidateData.category ?? '');
  final finalPhone =
      phone.trim().isNotEmpty ? phone : (candidateData.phone ?? '');
  final finalMenu = menu;
  final finalAmenities = amenities;
  final finalPlaceType = placeType;

  double lat, lng;
  if (locationStr.trim().isNotEmpty) {
    final parts = locationStr.split(',');
    lat = double.tryParse(parts[0].trim()) ?? 0;
    lng = double.tryParse(parts[1].trim()) ?? 0;
  } else {
    lat = candidateData.location?.latitude ?? 0;
    lng = candidateData.location?.longitude ?? 0;
  }

  final db = FirebaseFirestore.instance;
  final rRef = db.collection('restaurants').doc();

  await db.runTransaction((tx) async {
    tx.set(rRef, {
      'name': finalName,
      'address': finalAddress,
      'category': finalCategory,
      'phone': finalPhone,
      'menu': finalMenu,
      'amenities': finalAmenities,
      'place_type': finalPlaceType,
      'location': GeoPoint(lat, lng),
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });

    tx.update(candidateRef, {
      'status': 'approved_restaurant',
      'restaurants_ref': rRef,
      'approved_at': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  });
}
