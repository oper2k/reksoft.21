import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/main/info_message/info_message_widget.dart';
import '/profile/profile_components/upload_resume_import_fields/upload_resume_import_fields_widget.dart';
import 'dart:async';
import 'dart:math';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'upload_resume_model.dart';
export 'upload_resume_model.dart';

class UploadResumeWidget extends StatefulWidget {
  const UploadResumeWidget({super.key});

  @override
  State<UploadResumeWidget> createState() => _UploadResumeWidgetState();
}

class _UploadResumeWidgetState extends State<UploadResumeWidget>
    with TickerProviderStateMixin {
  late UploadResumeModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadResumeModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).primary,
            angle: 0.524,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 420.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(40.0, 60.0, 40.0, 60.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(24.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).gray,
                      width: 1.0,
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!_model.isLoadingFileStart)
                            Text(
                              'Перетащите pdf-файл или выберите c устройства',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).gray,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          if (_model.isFileLoadingComplete)
                            FaIcon(
                              FontAwesomeIcons.solidFilePdf,
                              color: FlutterFlowTheme.of(context).gray,
                              size: 42.0,
                            ),
                          if (_model.isFileLoadingComplete)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Text(
                                'Файл загружен',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context).gray,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          if (!_model.isLoadingFileStart)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 22.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.link,
                                    color: FlutterFlowTheme.of(context).gray,
                                    size: 24.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Выбрать файл',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .gray,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (_model.isLoadingFileStart && !_model.isFileLoadingComplete)
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Lottie.asset(
                      'assets/lottie_animations/loading.json',
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                      animate: true,
                    ),
                  ),
                Builder(
                  builder: (context) => Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 200.0,
                    child: custom_widgets.UploadDropzone(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 200.0,
                      maxSizeInKbytes: 5240,
                      allowedTypes: ["pdf"],
                      onFileUploaded:
                          (file, isSuccess, fileSize, fileName) async {
                        if (isSuccess) {
                          _model.isLoadingFileStart = true;
                          _model.isFileLoadingComplete = false;
                          _model.fileName = fileName;
                          setState(() {});
                          {
                            setState(() => _model.isDataUploading = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];
                            var selectedFiles = <SelectedFile>[];
                            var downloadUrls = <String>[];
                            try {
                              selectedUploadedFiles = file!.bytes!.isNotEmpty
                                  ? [file!]
                                  : <FFUploadedFile>[];
                              selectedFiles = selectedFilesFromUploadedFiles(
                                selectedUploadedFiles,
                              );
                              downloadUrls = (await Future.wait(
                                selectedFiles.map(
                                  (f) async =>
                                      await uploadData(f.storagePath, f.bytes),
                                ),
                              ))
                                  .where((u) => u != null)
                                  .map((u) => u!)
                                  .toList();
                            } finally {
                              _model.isDataUploading = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedFiles.length &&
                                downloadUrls.length == selectedFiles.length) {
                              setState(() {
                                _model.uploadedLocalFile =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl = downloadUrls.first;
                              });
                            } else {
                              setState(() {});
                              return;
                            }
                          }

                          await currentUserReference!
                              .update(createUsersRecordData(
                            resumeLink: _model.uploadedFileUrl,
                          ));
                          _model.isFileLoadingComplete = true;
                          setState(() {});
                        } else {
                          await showDialog(
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: InfoMessageWidget(
                                  text: 'Произошла ошибка при загрузке файла',
                                  isError: true,
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            if (valueOrDefault(currentUserDocument?.resumeLink, '') == null ||
                valueOrDefault(currentUserDocument?.resumeLink, '') == '')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => Text(
                    'Вы можете загрузить PDF файл не более 5мб',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).gray,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 34.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (_model.fileName != null && _model.fileName != '')
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          _model.fileName,
                          '-_-',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  if (false)
                    Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        shape: BoxShape.circle,
                      ),
                      child: Visibility(
                        visible: _model.isFileLoadingComplete,
                        child: Icon(
                          Icons.check,
                          color: FlutterFlowTheme.of(context).info,
                          size: 20.0,
                        ),
                      ),
                    ),
                  if (_model.isFileLoadingComplete)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.fileName = null;
                          _model.isLoadingFileStart = false;
                          _model.isFileLoadingComplete = false;
                          setState(() {});
                          setState(() {
                            _model.isDataUploading = false;
                            _model.uploadedLocalFile =
                                FFUploadedFile(bytes: Uint8List.fromList([]));
                            _model.uploadedFileUrl = '';
                          });
                        },
                        child: Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).darkBlue,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            color: FlutterFlowTheme.of(context).info,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (_model.isLoadingFileStart && !_model.isFileLoadingComplete)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      _model.isFileLoadingComplete == true
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation2']!),
              ),
            if (_model.isFileLoadingComplete)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            Builder(
              builder: (context) => Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: (!_model.isFileLoadingComplete ||
                          (_model.uploadedFileUrl == null ||
                              _model.uploadedFileUrl == ''))
                      ? null
                      : () async {
                          await currentUserReference!
                              .update(createUsersRecordData(
                            resumeLink: _model.uploadedFileUrl,
                          ));
                          unawaited(
                            () async {
                              _model.gptResponseAnalysFile =
                                  await SendFileToGPTCall.call(
                                fileUrl: _model.uploadedFileUrl,
                                userId: currentUserUid,
                              );
                            }(),
                          );
                          FFAppState().isResumeUploaded = true;
                          FFAppState().update(() {});
                          Navigator.pop(context);
                          if (!((currentUserDocument?.educationPlaces
                                          ?.toList() ??
                                      [])
                                  .isNotEmpty) &&
                              !((currentUserDocument?.workPlaces?.toList() ??
                                      [])
                                  .isNotEmpty)) {
                            await showDialog(
                              barrierColor:
                                  FlutterFlowTheme.of(context).customColor1,
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: UploadResumeImportFieldsWidget(),
                                );
                              },
                            ).then((value) => setState(() {}));
                          } else {
                            showDialog(
                              barrierColor:
                                  FlutterFlowTheme.of(context).customColor1,
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: InfoMessageWidget(
                                    text:
                                        'Резюме успешно загружено! Теперь работодателю видна информация о вас',
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          }

                          setState(() {});
                        },
                  text: 'Дальше',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                    disabledColor: FlutterFlowTheme.of(context).gray,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!);
  }
}
