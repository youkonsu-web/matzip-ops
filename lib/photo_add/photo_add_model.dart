import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'photo_add_widget.dart' show PhotoAddWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhotoAddModel extends FlutterFlowModel<PhotoAddWidget> {
  ///  Local state fields for this page.

  List<String> photoMPV = [];
  void addToPhotoMPV(String item) => photoMPV.add(item);
  void removeFromPhotoMPV(String item) => photoMPV.remove(item);
  void removeAtIndexFromPhotoMPV(int index) => photoMPV.removeAt(index);
  void insertAtIndexInPhotoMPV(int index, String item) =>
      photoMPV.insert(index, item);
  void updatePhotoMPVAtIndex(int index, Function(String) updateFn) =>
      photoMPV[index] = updateFn(photoMPV[index]);

  bool pisloading = false;

  List<String> pCfImageIds = [];
  void addToPCfImageIds(String item) => pCfImageIds.add(item);
  void removeFromPCfImageIds(String item) => pCfImageIds.remove(item);
  void removeAtIndexFromPCfImageIds(int index) => pCfImageIds.removeAt(index);
  void insertAtIndexInPCfImageIds(int index, String item) =>
      pCfImageIds.insert(index, item);
  void updatePCfImageIdsAtIndex(int index, Function(String) updateFn) =>
      pCfImageIds[index] = updateFn(pCfImageIds[index]);

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataI8f = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataI8f = [];

  // Stores action output result for [Custom Action - callGetDirectUpload] action in IconButton widget.
  dynamic? upload;
  // Stores action output result for [Custom Action - cfUploadOne] action in IconButton widget.
  String? cfUploadOne;
  // Stores action output result for [Custom Action - reorderByOldNew] action in ListView widget.
  List<String>? reorderedCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
