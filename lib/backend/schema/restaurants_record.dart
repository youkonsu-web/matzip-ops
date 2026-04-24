import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RestaurantsRecord extends FirestoreRecord {
  RestaurantsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "amenities" field.
  String? _amenities;
  String get amenities => _amenities ?? '';
  bool hasAmenities() => _amenities != null;

  // "menu" field.
  String? _menu;
  String get menu => _menu ?? '';
  bool hasMenu() => _menu != null;

  // "opening_hours" field.
  String? _openingHours;
  String get openingHours => _openingHours ?? '';
  bool hasOpeningHours() => _openingHours != null;

  // "main_image" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  bool hasMainImage() => _mainImage != null;

  // "main_image_cf_ids" field.
  List<String>? _mainImageCfIds;
  List<String> get mainImageCfIds => _mainImageCfIds ?? const [];
  bool hasMainImageCfIds() => _mainImageCfIds != null;

  // "db_MPV_updated" field.
  bool? _dbMPVUpdated;
  bool get dbMPVUpdated => _dbMPVUpdated ?? false;
  bool hasDbMPVUpdated() => _dbMPVUpdated != null;

  // "db_restaurant_direct_updated" field.
  bool? _dbRestaurantDirectUpdated;
  bool get dbRestaurantDirectUpdated => _dbRestaurantDirectUpdated ?? false;
  bool hasDbRestaurantDirectUpdated() => _dbRestaurantDirectUpdated != null;

  // "latest_update_by" field.
  String? _latestUpdateBy;
  String get latestUpdateBy => _latestUpdateBy ?? '';
  bool hasLatestUpdateBy() => _latestUpdateBy != null;

  // "menu_image_cf_ids" field.
  List<String>? _menuImageCfIds;
  List<String> get menuImageCfIds => _menuImageCfIds ?? const [];
  bool hasMenuImageCfIds() => _menuImageCfIds != null;

  // "menu_code_secondary" field.
  String? _menuCodeSecondary;
  String get menuCodeSecondary => _menuCodeSecondary ?? '';
  bool hasMenuCodeSecondary() => _menuCodeSecondary != null;

  // "regionCode" field.
  String? _regionCode;
  String get regionCode => _regionCode ?? '';
  bool hasRegionCode() => _regionCode != null;

  // "regionName" field.
  String? _regionName;
  String get regionName => _regionName ?? '';
  bool hasRegionName() => _regionName != null;

  // "regionType" field.
  String? _regionType;
  String get regionType => _regionType ?? '';
  bool hasRegionType() => _regionType != null;

  // "regionDisplayName" field.
  String? _regionDisplayName;
  String get regionDisplayName => _regionDisplayName ?? '';
  bool hasRegionDisplayName() => _regionDisplayName != null;

  // "sanggwonName" field.
  String? _sanggwonName;
  String get sanggwonName => _sanggwonName ?? '';
  bool hasSanggwonName() => _sanggwonName != null;

  // "sanggwonId" field.
  String? _sanggwonId;
  String get sanggwonId => _sanggwonId ?? '';
  bool hasSanggwonId() => _sanggwonId != null;

  // "photo_count_total" field.
  int? _photoCountTotal;
  int get photoCountTotal => _photoCountTotal ?? 0;
  bool hasPhotoCountTotal() => _photoCountTotal != null;

  // "photo_count_general" field.
  int? _photoCountGeneral;
  int get photoCountGeneral => _photoCountGeneral ?? 0;
  bool hasPhotoCountGeneral() => _photoCountGeneral != null;

  // "photo_count_menu" field.
  int? _photoCountMenu;
  int get photoCountMenu => _photoCountMenu ?? 0;
  bool hasPhotoCountMenu() => _photoCountMenu != null;

  // "photo_preview_ids" field.
  List<String>? _photoPreviewIds;
  List<String> get photoPreviewIds => _photoPreviewIds ?? const [];
  bool hasPhotoPreviewIds() => _photoPreviewIds != null;

  // "menu_photo_preview_ids" field.
  List<String>? _menuPhotoPreviewIds;
  List<String> get menuPhotoPreviewIds => _menuPhotoPreviewIds ?? const [];
  bool hasMenuPhotoPreviewIds() => _menuPhotoPreviewIds != null;

  // "latest_photo_at" field.
  DateTime? _latestPhotoAt;
  DateTime? get latestPhotoAt => _latestPhotoAt;
  bool hasLatestPhotoAt() => _latestPhotoAt != null;

  // "latest_general_photo_at" field.
  DateTime? _latestGeneralPhotoAt;
  DateTime? get latestGeneralPhotoAt => _latestGeneralPhotoAt;
  bool hasLatestGeneralPhotoAt() => _latestGeneralPhotoAt != null;

  // "latest_menu_photo_at" field.
  DateTime? _latestMenuPhotoAt;
  DateTime? get latestMenuPhotoAt => _latestMenuPhotoAt;
  bool hasLatestMenuPhotoAt() => _latestMenuPhotoAt != null;

  // "place_type" field.
  String? _placeType;
  String get placeType => _placeType ?? '';
  bool hasPlaceType() => _placeType != null;

  // "place_type_source" field.
  String? _placeTypeSource;
  String get placeTypeSource => _placeTypeSource ?? '';
  bool hasPlaceTypeSource() => _placeTypeSource != null;

  // "is_theme_cafe" field.
  bool? _isThemeCafe;
  bool get isThemeCafe => _isThemeCafe ?? false;
  bool hasIsThemeCafe() => _isThemeCafe != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "main_image_ids" field.
  List<String>? _mainImageIds;
  List<String> get mainImageIds => _mainImageIds ?? const [];
  bool hasMainImageIds() => _mainImageIds != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _address = snapshotData['address'] as String?;
    _category = snapshotData['category'] as String?;
    _phone = snapshotData['phone'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _amenities = snapshotData['amenities'] as String?;
    _menu = snapshotData['menu'] as String?;
    _openingHours = snapshotData['opening_hours'] as String?;
    _mainImage = snapshotData['main_image'] as String?;
    _mainImageCfIds = getDataList(snapshotData['main_image_cf_ids']);
    _dbMPVUpdated = snapshotData['db_MPV_updated'] as bool?;
    _dbRestaurantDirectUpdated =
        snapshotData['db_restaurant_direct_updated'] as bool?;
    _latestUpdateBy = snapshotData['latest_update_by'] as String?;
    _menuImageCfIds = getDataList(snapshotData['menu_image_cf_ids']);
    _menuCodeSecondary = snapshotData['menu_code_secondary'] as String?;
    _regionCode = snapshotData['regionCode'] as String?;
    _regionName = snapshotData['regionName'] as String?;
    _regionType = snapshotData['regionType'] as String?;
    _regionDisplayName = snapshotData['regionDisplayName'] as String?;
    _sanggwonName = snapshotData['sanggwonName'] as String?;
    _sanggwonId = snapshotData['sanggwonId'] as String?;
    _photoCountTotal = castToType<int>(snapshotData['photo_count_total']);
    _photoCountGeneral = castToType<int>(snapshotData['photo_count_general']);
    _photoCountMenu = castToType<int>(snapshotData['photo_count_menu']);
    _photoPreviewIds = getDataList(snapshotData['photo_preview_ids']);
    _menuPhotoPreviewIds = getDataList(snapshotData['menu_photo_preview_ids']);
    _latestPhotoAt = snapshotData['latest_photo_at'] as DateTime?;
    _latestGeneralPhotoAt =
        snapshotData['latest_general_photo_at'] as DateTime?;
    _latestMenuPhotoAt = snapshotData['latest_menu_photo_at'] as DateTime?;
    _placeType = snapshotData['place_type'] as String?;
    _placeTypeSource = snapshotData['place_type_source'] as String?;
    _isThemeCafe = snapshotData['is_theme_cafe'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _mainImageIds = getDataList(snapshotData['main_image_ids']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('restaurants');

  static Stream<RestaurantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RestaurantsRecord.fromSnapshot(s));

  static Future<RestaurantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RestaurantsRecord.fromSnapshot(s));

  static RestaurantsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RestaurantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RestaurantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RestaurantsRecord._(reference, mapFromFirestore(data));

  static RestaurantsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      RestaurantsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'address': snapshot.data['address'],
          'category': snapshot.data['category'],
          'phone': snapshot.data['phone'],
          'location': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'amenities': snapshot.data['amenities'],
          'menu': snapshot.data['menu'],
          'opening_hours': snapshot.data['opening_hours'],
          'main_image': snapshot.data['main_image'],
          'main_image_cf_ids': safeGet(
            () => snapshot.data['main_image_cf_ids'].toList(),
          ),
          'db_MPV_updated': snapshot.data['db_MPV_updated'],
          'db_restaurant_direct_updated':
              snapshot.data['db_restaurant_direct_updated'],
          'latest_update_by': snapshot.data['latest_update_by'],
          'menu_image_cf_ids': safeGet(
            () => snapshot.data['menu_image_cf_ids'].toList(),
          ),
          'menu_code_secondary': snapshot.data['menu_code_secondary'],
          'regionCode': snapshot.data['regionCode'],
          'regionName': snapshot.data['regionName'],
          'regionType': snapshot.data['regionType'],
          'regionDisplayName': snapshot.data['regionDisplayName'],
          'sanggwonName': snapshot.data['sanggwonName'],
          'sanggwonId': snapshot.data['sanggwonId'],
          'photo_count_total': convertAlgoliaParam(
            snapshot.data['photo_count_total'],
            ParamType.int,
            false,
          ),
          'photo_count_general': convertAlgoliaParam(
            snapshot.data['photo_count_general'],
            ParamType.int,
            false,
          ),
          'photo_count_menu': convertAlgoliaParam(
            snapshot.data['photo_count_menu'],
            ParamType.int,
            false,
          ),
          'photo_preview_ids': safeGet(
            () => snapshot.data['photo_preview_ids'].toList(),
          ),
          'menu_photo_preview_ids': safeGet(
            () => snapshot.data['menu_photo_preview_ids'].toList(),
          ),
          'latest_photo_at': convertAlgoliaParam(
            snapshot.data['latest_photo_at'],
            ParamType.DateTime,
            false,
          ),
          'latest_general_photo_at': convertAlgoliaParam(
            snapshot.data['latest_general_photo_at'],
            ParamType.DateTime,
            false,
          ),
          'latest_menu_photo_at': convertAlgoliaParam(
            snapshot.data['latest_menu_photo_at'],
            ParamType.DateTime,
            false,
          ),
          'place_type': snapshot.data['place_type'],
          'place_type_source': snapshot.data['place_type_source'],
          'is_theme_cafe': snapshot.data['is_theme_cafe'],
          'createdAt': convertAlgoliaParam(
            snapshot.data['createdAt'],
            ParamType.DateTime,
            false,
          ),
          'updatedAt': convertAlgoliaParam(
            snapshot.data['updatedAt'],
            ParamType.DateTime,
            false,
          ),
          'main_image_ids': safeGet(
            () => snapshot.data['main_image_ids'].toList(),
          ),
        },
        RestaurantsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<RestaurantsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'restaurants',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'RestaurantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RestaurantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRestaurantsRecordData({
  String? name,
  String? address,
  String? category,
  String? phone,
  LatLng? location,
  String? amenities,
  String? menu,
  String? openingHours,
  String? mainImage,
  bool? dbMPVUpdated,
  bool? dbRestaurantDirectUpdated,
  String? latestUpdateBy,
  String? menuCodeSecondary,
  String? regionCode,
  String? regionName,
  String? regionType,
  String? regionDisplayName,
  String? sanggwonName,
  String? sanggwonId,
  int? photoCountTotal,
  int? photoCountGeneral,
  int? photoCountMenu,
  DateTime? latestPhotoAt,
  DateTime? latestGeneralPhotoAt,
  DateTime? latestMenuPhotoAt,
  String? placeType,
  String? placeTypeSource,
  bool? isThemeCafe,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'address': address,
      'category': category,
      'phone': phone,
      'location': location,
      'amenities': amenities,
      'menu': menu,
      'opening_hours': openingHours,
      'main_image': mainImage,
      'db_MPV_updated': dbMPVUpdated,
      'db_restaurant_direct_updated': dbRestaurantDirectUpdated,
      'latest_update_by': latestUpdateBy,
      'menu_code_secondary': menuCodeSecondary,
      'regionCode': regionCode,
      'regionName': regionName,
      'regionType': regionType,
      'regionDisplayName': regionDisplayName,
      'sanggwonName': sanggwonName,
      'sanggwonId': sanggwonId,
      'photo_count_total': photoCountTotal,
      'photo_count_general': photoCountGeneral,
      'photo_count_menu': photoCountMenu,
      'latest_photo_at': latestPhotoAt,
      'latest_general_photo_at': latestGeneralPhotoAt,
      'latest_menu_photo_at': latestMenuPhotoAt,
      'place_type': placeType,
      'place_type_source': placeTypeSource,
      'is_theme_cafe': isThemeCafe,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class RestaurantsRecordDocumentEquality implements Equality<RestaurantsRecord> {
  const RestaurantsRecordDocumentEquality();

  @override
  bool equals(RestaurantsRecord? e1, RestaurantsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.address == e2?.address &&
        e1?.category == e2?.category &&
        e1?.phone == e2?.phone &&
        e1?.location == e2?.location &&
        e1?.amenities == e2?.amenities &&
        e1?.menu == e2?.menu &&
        e1?.openingHours == e2?.openingHours &&
        e1?.mainImage == e2?.mainImage &&
        listEquality.equals(e1?.mainImageCfIds, e2?.mainImageCfIds) &&
        e1?.dbMPVUpdated == e2?.dbMPVUpdated &&
        e1?.dbRestaurantDirectUpdated == e2?.dbRestaurantDirectUpdated &&
        e1?.latestUpdateBy == e2?.latestUpdateBy &&
        listEquality.equals(e1?.menuImageCfIds, e2?.menuImageCfIds) &&
        e1?.menuCodeSecondary == e2?.menuCodeSecondary &&
        e1?.regionCode == e2?.regionCode &&
        e1?.regionName == e2?.regionName &&
        e1?.regionType == e2?.regionType &&
        e1?.regionDisplayName == e2?.regionDisplayName &&
        e1?.sanggwonName == e2?.sanggwonName &&
        e1?.sanggwonId == e2?.sanggwonId &&
        e1?.photoCountTotal == e2?.photoCountTotal &&
        e1?.photoCountGeneral == e2?.photoCountGeneral &&
        e1?.photoCountMenu == e2?.photoCountMenu &&
        listEquality.equals(e1?.photoPreviewIds, e2?.photoPreviewIds) &&
        listEquality.equals(e1?.menuPhotoPreviewIds, e2?.menuPhotoPreviewIds) &&
        e1?.latestPhotoAt == e2?.latestPhotoAt &&
        e1?.latestGeneralPhotoAt == e2?.latestGeneralPhotoAt &&
        e1?.latestMenuPhotoAt == e2?.latestMenuPhotoAt &&
        e1?.placeType == e2?.placeType &&
        e1?.placeTypeSource == e2?.placeTypeSource &&
        e1?.isThemeCafe == e2?.isThemeCafe &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        listEquality.equals(e1?.mainImageIds, e2?.mainImageIds);
  }

  @override
  int hash(RestaurantsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.address,
        e?.category,
        e?.phone,
        e?.location,
        e?.amenities,
        e?.menu,
        e?.openingHours,
        e?.mainImage,
        e?.mainImageCfIds,
        e?.dbMPVUpdated,
        e?.dbRestaurantDirectUpdated,
        e?.latestUpdateBy,
        e?.menuImageCfIds,
        e?.menuCodeSecondary,
        e?.regionCode,
        e?.regionName,
        e?.regionType,
        e?.regionDisplayName,
        e?.sanggwonName,
        e?.sanggwonId,
        e?.photoCountTotal,
        e?.photoCountGeneral,
        e?.photoCountMenu,
        e?.photoPreviewIds,
        e?.menuPhotoPreviewIds,
        e?.latestPhotoAt,
        e?.latestGeneralPhotoAt,
        e?.latestMenuPhotoAt,
        e?.placeType,
        e?.placeTypeSource,
        e?.isThemeCafe,
        e?.createdAt,
        e?.updatedAt,
        e?.mainImageIds
      ]);

  @override
  bool isValidKey(Object? o) => o is RestaurantsRecord;
}
