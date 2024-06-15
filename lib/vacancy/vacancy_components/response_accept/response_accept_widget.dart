import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/info_message/info_message_widget.dart';
import '/vacancy/vacancy_components/response_decline/response_decline_widget.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'response_accept_model.dart';
export 'response_accept_model.dart';

class ResponseAcceptWidget extends StatefulWidget {
  const ResponseAcceptWidget({
    super.key,
    required this.response,
    required this.user,
    required this.vacancy,
  });

  final ResponseRecord? response;
  final UsersRecord? user;
  final VacanciesRecord? vacancy;

  @override
  State<ResponseAcceptWidget> createState() => _ResponseAcceptWidgetState();
}

class _ResponseAcceptWidgetState extends State<ResponseAcceptWidget>
    with TickerProviderStateMixin {
  late ResponseAcceptModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResponseAcceptModel());

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Результаты вводного AI интервью',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
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
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '${widget.user?.displayName} ${widget.user?.surname}',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        Text(
                          'на должность  ${widget.vacancy?.jobTitle}',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ].divide(SizedBox(width: 5.0)),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.response?.chatSummary,
                        'Нет данных',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
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
                              await widget.response!.reference
                                  .update(createResponseRecordData(
                                status: 'Приглашение',
                              ));

                              await NotificationsRecord.collection.doc().set({
                                ...createNotificationsRecordData(
                                  from: currentUserReference,
                                  to: widget.user?.reference,
                                  type: 'Приглашение',
                                  text:
                                      'Здравствуйте. Мы рассмотрели ваше резюме на должность \"${widget.vacancy?.jobTitle}\", и приняли решение пригласить вас на работу',
                                  isViewed: false,
                                  response: widget.response?.reference,
                                  vacancy: widget.vacancy?.reference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'created_time':
                                        FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
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
                                      text: 'Приглашение отправлено',
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            text: 'Пригласить на работу',
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
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
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
                                    child: ResponseDeclineWidget(
                                      response: widget.response!,
                                      vacancy: widget.vacancy!,
                                      user: widget.user!,
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            child: Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).error,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Отказать',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
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
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
