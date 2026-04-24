import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'photo_add_model.dart';
export 'photo_add_model.dart';

class PhotoAddWidget extends StatefulWidget {
  const PhotoAddWidget({
    super.key,
    required this.restaurantsDoc,
  });

  final RestaurantsRecord? restaurantsDoc;

  static String routeName = 'PhotoAdd';
  static String routePath = '/photoAdd';

  @override
  State<PhotoAddWidget> createState() => _PhotoAddWidgetState();
}

class _PhotoAddWidgetState extends State<PhotoAddWidget> {
  late PhotoAddModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoAddModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.pCfImageIds =
          widget!.restaurantsDoc!.mainImageIds.toList().cast<String>();
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Text(
                  '맛집도감 관리자 페이지',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'yeoljeongdo',
                        color: Color(0xFFD31515),
                        fontSize: 28.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ),
            actions: [],
            centerTitle: false,
            toolbarHeight: 100.0,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(200.0, 0.0, 200.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget!.restaurantsDoc?.name,
                                '식당명',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'pretendard',
                                    fontSize: 40.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget!.restaurantsDoc?.address,
                              '주소',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'pretendard',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 200.0,
                                  fillColor: Color(0xFFBDBDBD),
                                  icon: Icon(
                                    Icons.add_sharp,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 60.0,
                                  ),
                                  onPressed: () async {
                                    if (!_model.pisloading) {
                                      _model.pisloading = true;
                                      safeSetState(() {});
                                      final selectedMedia = await selectMedia(
                                        maxWidth: 2500.00,
                                        imageQuality: 85,
                                        mediaSource: MediaSource.photoGallery,
                                        multiImage: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        safeSetState(() => _model
                                                .isDataUploading_uploadDataI8f =
                                            true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                    originalFilename:
                                                        m.originalFilename,
                                                  ))
                                              .toList();
                                        } finally {
                                          _model.isDataUploading_uploadDataI8f =
                                              false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          safeSetState(() {
                                            _model.uploadedLocalFiles_uploadDataI8f =
                                                selectedUploadedFiles;
                                          });
                                        } else {
                                          safeSetState(() {});
                                          return;
                                        }
                                      }

                                      for (int loop1Index = 0;
                                          loop1Index <
                                              _model
                                                  .uploadedLocalFiles_uploadDataI8f
                                                  .length;
                                          loop1Index++) {
                                        final currentLoop1Item = _model
                                                .uploadedLocalFiles_uploadDataI8f[
                                            loop1Index];
                                        _model.upload =
                                            await actions.callGetDirectUpload(
                                          'restaurantMainMPV',
                                          '',
                                        );
                                        if (_model.upload != null) {
                                          _model.cfUploadOne =
                                              await actions.cfUploadOne(
                                            currentLoop1Item,
                                            getJsonField(
                                              _model.upload,
                                              r'''$.uploadURL''',
                                            ).toString(),
                                            getJsonField(
                                              _model.upload,
                                              r'''$.imageId''',
                                            ).toString(),
                                            getJsonField(
                                              _model.upload,
                                              r'''$.contentType''',
                                            ).toString(),
                                          );
                                          _model.addToPCfImageIds(
                                              _model.cfUploadOne!);
                                          safeSetState(() {});
                                        }
                                      }
                                      _model.pisloading = false;
                                      safeSetState(() {});
                                    }

                                    safeSetState(() {});
                                  },
                                ),
                              ),
                              Container(
                                width: 830.73,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final imageList =
                                        _model.pCfImageIds.toList();

                                    return ReorderableListView.builder(
                                      padding: EdgeInsets.zero,
                                      proxyDecorator: (Widget child, int index,
                                              Animation<double> animation) =>
                                          Material(
                                              color: Colors.transparent,
                                              child: child),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: imageList.length,
                                      itemBuilder: (context, imageListIndex) {
                                        final imageListItem =
                                            imageList[imageListIndex];
                                        return Container(
                                          key: ValueKey("ListView_vdzf7fk6" +
                                              '_' +
                                              imageListIndex.toString()),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Container(
                                              width: 200.0,
                                              height: 200.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    valueOrDefault<String>(
                                                      functions.cfUrlByVariant(
                                                          _model.pCfImageIds
                                                              .elementAtOrNull(
                                                                  imageListIndex),
                                                          'sqthumb',
                                                          ''),
                                                      'https://picsum.photos/seed/456/600',
                                                    ),
                                                  ).image,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 36.0,
                                                        height: 36.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x9ADF1917),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            (imageListIndex + 1)
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'pretendard',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model
                                                              .removeFromPCfImageIds(
                                                                  imageListItem);
                                                          safeSetState(() {});
                                                        },
                                                        child: Container(
                                                          width: 36.0,
                                                          height: 36.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x9A000000),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24.0),
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .cancel_rounded,
                                                            color: Color(
                                                                0x99FFFFFF),
                                                            size: 36.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      onReorder: (int reorderableOldIndex,
                                          int reorderableNewIndex) async {
                                        if (!_model.pisloading) {
                                          _model.reorderedCopy =
                                              await actions.reorderByOldNew(
                                            reorderableOldIndex,
                                            reorderableNewIndex,
                                            _model.pCfImageIds.toList(),
                                          );
                                          _model.pCfImageIds = _model
                                              .reorderedCopy!
                                              .toList()
                                              .cast<String>();
                                          safeSetState(() {});
                                        }

                                        safeSetState(() {});
                                      },
                                    );
                                  },
                                ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 50.0, 0.0, 0.0),
                            child: Container(
                              width: 208.0,
                              height: 54.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFD31515),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  '수정 완료',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'pretendard',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
