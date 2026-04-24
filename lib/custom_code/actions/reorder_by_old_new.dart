// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> reorderByOldNew(
  int oldIndex,
  int newIndex,
  List<String> items,
) async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  final List<String> newList = List<String>.from(items);

  if (oldIndex < newIndex) {
    newIndex -= 1;
  }

  final String movedItem = newList.removeAt(oldIndex);
  newList.insert(newIndex, movedItem);

  return newList;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
