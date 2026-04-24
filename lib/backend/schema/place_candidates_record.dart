import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceCandidatesRecord extends FirestoreRecord {
  PlaceCandidatesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "submitted_at" field.
  DateTime? _submittedAt;
  DateTime? get submittedAt => _submittedAt;
  bool hasSubmittedAt() => _submittedAt != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "jibun_address" field.
  String? _jibunAddress;
  String get jibunAddress => _jibunAddress ?? '';
  bool hasJibunAddress() => _jibunAddress != null;

  // "road_address" field.
  String? _roadAddress;
  String get roadAddress => _roadAddress ?? '';
  bool hasRoadAddress() => _roadAddress != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "source_platform" field.
  String? _sourcePlatform;
  String get sourcePlatform => _sourcePlatform ?? '';
  bool hasSourcePlatform() => _sourcePlatform != null;

  // "source_raw_id" field.
  String? _sourceRawId;
  String get sourceRawId => _sourceRawId ?? '';
  bool hasSourceRawId() => _sourceRawId != null;

  // "submitted_by" field.
  DocumentReference? _submittedBy;
  DocumentReference? get submittedBy => _submittedBy;
  bool hasSubmittedBy() => _submittedBy != null;

  // "restaurants_ref" field.
  DocumentReference? _restaurantsRef;
  DocumentReference? get restaurantsRef => _restaurantsRef;
  bool hasRestaurantsRef() => _restaurantsRef != null;

  // "approved_at" field.
  DateTime? _approvedAt;
  DateTime? get approvedAt => _approvedAt;
  bool hasApprovedAt() => _approvedAt != null;

  // "approved_by" field.
  String? _approvedBy;
  String get approvedBy => _approvedBy ?? '';
  bool hasApprovedBy() => _approvedBy != null;

  // "rejected_at" field.
  DateTime? _rejectedAt;
  DateTime? get rejectedAt => _rejectedAt;
  bool hasRejectedAt() => _rejectedAt != null;

  // "rejected_by" field.
  String? _rejectedBy;
  String get rejectedBy => _rejectedBy ?? '';
  bool hasRejectedBy() => _rejectedBy != null;

  // "reject_reason" field.
  String? _rejectReason;
  String get rejectReason => _rejectReason ?? '';
  bool hasRejectReason() => _rejectReason != null;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _name = snapshotData['name'] as String?;
    _address = snapshotData['address'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _submittedAt = snapshotData['submitted_at'] as DateTime?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _jibunAddress = snapshotData['jibun_address'] as String?;
    _roadAddress = snapshotData['road_address'] as String?;
    _category = snapshotData['category'] as String?;
    _phone = snapshotData['phone'] as String?;
    _sourcePlatform = snapshotData['source_platform'] as String?;
    _sourceRawId = snapshotData['source_raw_id'] as String?;
    _submittedBy = snapshotData['submitted_by'] as DocumentReference?;
    _restaurantsRef = snapshotData['restaurants_ref'] as DocumentReference?;
    _approvedAt = snapshotData['approved_at'] as DateTime?;
    _approvedBy = snapshotData['approved_by'] as String?;
    _rejectedAt = snapshotData['rejected_at'] as DateTime?;
    _rejectedBy = snapshotData['rejected_by'] as String?;
    _rejectReason = snapshotData['reject_reason'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('place_candidates');

  static Stream<PlaceCandidatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlaceCandidatesRecord.fromSnapshot(s));

  static Future<PlaceCandidatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlaceCandidatesRecord.fromSnapshot(s));

  static PlaceCandidatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlaceCandidatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlaceCandidatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlaceCandidatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlaceCandidatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlaceCandidatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlaceCandidatesRecordData({
  String? status,
  String? name,
  String? address,
  LatLng? location,
  DateTime? submittedAt,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? jibunAddress,
  String? roadAddress,
  String? category,
  String? phone,
  String? sourcePlatform,
  String? sourceRawId,
  DocumentReference? submittedBy,
  DocumentReference? restaurantsRef,
  DateTime? approvedAt,
  String? approvedBy,
  DateTime? rejectedAt,
  String? rejectedBy,
  String? rejectReason,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'name': name,
      'address': address,
      'location': location,
      'submitted_at': submittedAt,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'jibun_address': jibunAddress,
      'road_address': roadAddress,
      'category': category,
      'phone': phone,
      'source_platform': sourcePlatform,
      'source_raw_id': sourceRawId,
      'submitted_by': submittedBy,
      'restaurants_ref': restaurantsRef,
      'approved_at': approvedAt,
      'approved_by': approvedBy,
      'rejected_at': rejectedAt,
      'rejected_by': rejectedBy,
      'reject_reason': rejectReason,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlaceCandidatesRecordDocumentEquality
    implements Equality<PlaceCandidatesRecord> {
  const PlaceCandidatesRecordDocumentEquality();

  @override
  bool equals(PlaceCandidatesRecord? e1, PlaceCandidatesRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.name == e2?.name &&
        e1?.address == e2?.address &&
        e1?.location == e2?.location &&
        e1?.submittedAt == e2?.submittedAt &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.jibunAddress == e2?.jibunAddress &&
        e1?.roadAddress == e2?.roadAddress &&
        e1?.category == e2?.category &&
        e1?.phone == e2?.phone &&
        e1?.sourcePlatform == e2?.sourcePlatform &&
        e1?.sourceRawId == e2?.sourceRawId &&
        e1?.submittedBy == e2?.submittedBy &&
        e1?.restaurantsRef == e2?.restaurantsRef &&
        e1?.approvedAt == e2?.approvedAt &&
        e1?.approvedBy == e2?.approvedBy &&
        e1?.rejectedAt == e2?.rejectedAt &&
        e1?.rejectedBy == e2?.rejectedBy &&
        e1?.rejectReason == e2?.rejectReason;
  }

  @override
  int hash(PlaceCandidatesRecord? e) => const ListEquality().hash([
        e?.status,
        e?.name,
        e?.address,
        e?.location,
        e?.submittedAt,
        e?.createdAt,
        e?.updatedAt,
        e?.jibunAddress,
        e?.roadAddress,
        e?.category,
        e?.phone,
        e?.sourcePlatform,
        e?.sourceRawId,
        e?.submittedBy,
        e?.restaurantsRef,
        e?.approvedAt,
        e?.approvedBy,
        e?.rejectedAt,
        e?.rejectedBy,
        e?.rejectReason
      ]);

  @override
  bool isValidKey(Object? o) => o is PlaceCandidatesRecord;
}
