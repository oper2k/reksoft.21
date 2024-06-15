import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/info_message/info_message_widget.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'upload_resume_import_fields_model.dart';
export 'upload_resume_import_fields_model.dart';

class UploadResumeImportFieldsWidget extends StatefulWidget {
  const UploadResumeImportFieldsWidget({super.key});

  @override
  State<UploadResumeImportFieldsWidget> createState() =>
      _UploadResumeImportFieldsWidgetState();
}

class _UploadResumeImportFieldsWidgetState
    extends State<UploadResumeImportFieldsWidget>
    with TickerProviderStateMixin {
  late UploadResumeImportFieldsModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadResumeImportFieldsModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: 592.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 24.0, 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Импортировать данные?',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                  Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).gray,
                        size: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'В вашем профиле нет данных о местах учёбы и работы.\nХотите импортириуем их из резюме c помощью ИИ?',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            unawaited(
                              () async {
                                _model.gptResponseParseFile =
                                    await ParseResumePDFFieldsByGPTCall.call(
                                  fileUrl: valueOrDefault(
                                      currentUserDocument?.resumeLink, ''),
                                  userId: currentUserUid,
                                );
                              }(),
                            );
                            Navigator.pop(context);
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
                                        'Резюме успешно загружено! Данные профиля обновятся в течении нескольких минут',
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));

                            setState(() {});
                          },
                          text: 'Да',
                          options: FFButtonOptions(
                            width: 184.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).secondary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                            showDialog(
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
                                    text:
                                        'Резюме успешно загружено! Теперь работодателю видна информация о вас',
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).lightGray1,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Нет, спасибо',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineMediumFamily,
                                    color: FlutterFlowTheme.of(context).gray,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 24.0)),
                ),
              ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
