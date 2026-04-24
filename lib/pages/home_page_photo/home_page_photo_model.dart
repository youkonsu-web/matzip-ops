import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'home_page_photo_widget.dart' show HomePagePhotoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePagePhotoModel extends FlutterFlowModel<HomePagePhotoWidget> {
  ///  Local state fields for this page.

  List<PlaceCandidatesRecord> candidateDocLists = [];
  void addToCandidateDocLists(PlaceCandidatesRecord item) =>
      candidateDocLists.add(item);
  void removeFromCandidateDocLists(PlaceCandidatesRecord item) =>
      candidateDocLists.remove(item);
  void removeAtIndexFromCandidateDocLists(int index) =>
      candidateDocLists.removeAt(index);
  void insertAtIndexInCandidateDocLists(
          int index, PlaceCandidatesRecord item) =>
      candidateDocLists.insert(index, item);
  void updateCandidateDocListsAtIndex(
          int index, Function(PlaceCandidatesRecord) updateFn) =>
      candidateDocLists[index] = updateFn(candidateDocLists[index]);

  String? restName;

  String? pRoadAddress;

  String? pJibunAddress;

  DateTime? pSubmittedTime;

  String? pCategory;

  String? pPhone;

  LatLng? pLocation;

  String? pSubmmitedBy;

  DocumentReference? selectedCandidateRef;

  PlaceCandidatesRecord? selectedCandidateData;

  String activeTab = 'new';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HomePage-photo widget.
  List<PlaceCandidatesRecord>? candidatesQuery;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Algolia Search Results from action on TextField
  List<RestaurantsRecord>? algoliaSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
