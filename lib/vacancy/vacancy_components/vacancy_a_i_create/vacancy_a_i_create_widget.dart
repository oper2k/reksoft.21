import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/info_message/info_message_widget.dart';
import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vacancy_a_i_create_model.dart';
export 'vacancy_a_i_create_model.dart';

class VacancyAICreateWidget extends StatefulWidget {
  const VacancyAICreateWidget({super.key});

  @override
  State<VacancyAICreateWidget> createState() => _VacancyAICreateWidgetState();
}

class _VacancyAICreateWidgetState extends State<VacancyAICreateWidget>
    with TickerProviderStateMixin {
  late VacancyAICreateModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VacancyAICreateModel());

    _model.jobTextController ??= TextEditingController();
    _model.jobFocusNode ??= FocusNode();

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
                    'Создать вакансию с помощью AI',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(),
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
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Введите название вакансии и требования к специалисту',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: TextFormField(
                  controller: _model.jobTextController,
                  focusNode: _model.jobFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.jobTextController',
                    Duration(milliseconds: 100),
                    () => setState(() {}),
                  ),
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Например, Javascript разработчик',
                    hintStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          color: FlutterFlowTheme.of(context).gray,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelMediumFamily),
                          lineHeight: 3.0,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).lightGray1,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                  maxLines: null,
                  minLines: 5,
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator:
                      _model.jobTextControllerValidator.asValidator(context),
                ),
              ),
              Builder(
                builder: (context) => Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: (_model.jobTextController.text == null ||
                            _model.jobTextController.text == '')
                        ? null
                        : () async {
                            var vacanciesRecordReference =
                                VacanciesRecord.collection.doc();
                            await vacanciesRecordReference
                                .set(createVacanciesRecordData(
                              jobTitle: 'Создается с ИИ...',
                              creator: currentUserReference,
                              city: valueOrDefault<String>(
                                valueOrDefault(currentUserDocument?.city, ''),
                                'Москва',
                              ),
                              salaryMin: 100000,
                              salaryForFilter: 100000,
                              createdTime: getCurrentTimestamp,
                            ));
                            _model.newVacancy =
                                VacanciesRecord.getDocumentFromData(
                                    createVacanciesRecordData(
                                      jobTitle: 'Создается с ИИ...',
                                      creator: currentUserReference,
                                      city: valueOrDefault<String>(
                                        valueOrDefault(
                                            currentUserDocument?.city, ''),
                                        'Москва',
                                      ),
                                      salaryMin: 100000,
                                      salaryForFilter: 100000,
                                      createdTime: getCurrentTimestamp,
                                    ),
                                    vacanciesRecordReference);
                            unawaited(
                              () async {
                                _model.apiGeneratingResult =
                                    await GenerateVacancyCall.call(
                                  vacancyDescription:
                                      _model.jobTextController.text,
                                  vacancyId: _model.newVacancy?.reference.id,
                                );
                              }(),
                            );

                            _model.updatePage(() {});
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
                                        'Вакансия создается. Пожалуйста, подождите...',
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));

                            setState(() {});
                          },
                    text: 'Создать вакансию',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
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
                      disabledColor: Color(0xFFC7C7C8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
