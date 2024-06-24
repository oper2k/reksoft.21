import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/info_message/info_message_widget.dart';
import '/placeholders/empty_available_times2/empty_available_times2_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'applicant_calendar_model.dart';
export 'applicant_calendar_model.dart';

class ApplicantCalendarWidget extends StatefulWidget {
  const ApplicantCalendarWidget({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.morning,
    required this.day,
    required this.evening,
    required this.weekends,
    this.lockedDates,
    required this.hr,
    this.response,
    this.vacancy,
  });

  final DateTime? startDate;
  final DateTime? endDate;
  final List<String>? morning;
  final List<String>? day;
  final List<String>? evening;
  final List<String>? weekends;
  final List<AvailableDatesStruct>? lockedDates;
  final DocumentReference? hr;
  final DocumentReference? response;
  final DocumentReference? vacancy;

  @override
  State<ApplicantCalendarWidget> createState() =>
      _ApplicantCalendarWidgetState();
}

class _ApplicantCalendarWidgetState extends State<ApplicantCalendarWidget> {
  late ApplicantCalendarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApplicantCalendarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.dateStart = widget.startDate;
      _model.dateEnd = widget.endDate;
      _model.morningHours = widget.morning!.toList().cast<String>();
      _model.dayHours = widget.day!.toList().cast<String>();
      _model.eveningHours = widget.evening!.toList().cast<String>();
      _model.weekends = widget.weekends!.toList().cast<String>();
      _model.lockedDates =
          widget.lockedDates!.toList().cast<AvailableDatesStruct>();
      _model.updatePage(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(valueOrDefault<double>(
                () {
                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                    return 0.0;
                  } else if (MediaQuery.sizeOf(context).width <
                      kBreakpointMedium) {
                    return 24.0;
                  } else if (MediaQuery.sizeOf(context).width <
                      kBreakpointLarge) {
                    return 24.0;
                  } else {
                    return 24.0;
                  }
                }(),
                0.0,
              )),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  valueOrDefault<double>(
                    () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return 16.0;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return 102.0;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return 102.0;
                      } else {
                        return 102.0;
                      }
                    }(),
                    0.0,
                  ),
                  54.0,
                  valueOrDefault<double>(
                    () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return 16.0;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return 102.0;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return 102.0;
                      } else {
                        return 102.0;
                      }
                    }(),
                    0.0,
                  ),
                  54.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 454.0,
                    decoration: BoxDecoration(),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        valueOrDefault<double>(
                          () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return 16.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return 48.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return 48.0;
                            } else {
                              return 48.0;
                            }
                          }(),
                          0.0,
                        ),
                        0.0,
                        valueOrDefault<double>(
                          () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return 16.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return 48.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return 48.0;
                            } else {
                              return 48.0;
                            }
                          }(),
                          0.0,
                        ),
                        0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Выбор даты и времени \nдля интервью',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              37.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                FFIcons.kclose,
                                color: FlutterFlowTheme.of(context).gray,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 329.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final day = functions
                                  .generateDates(widget.startDate,
                                      widget.endDate, widget.weekends!.toList())
                                  .where((e) => e >= getCurrentTimestamp)
                                  .toList()
                                  .take(7)
                                  .toList();
                              if (day.isEmpty) {
                                return EmptyAvailableTimes2Widget();
                              }
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: List.generate(day.length, (dayIndex) {
                                  final dayItem = day[dayIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            dateTimeFormat(
                                              'dd MMMM (EEEE)',
                                              dayItem,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final hour = functions
                                                .generateHours(
                                                    widget.morning!.toList(),
                                                    widget.day!.toList(),
                                                    widget.evening!.toList())
                                                .toList();
                                            return Wrap(
                                              spacing: 12.0,
                                              runSpacing: 12.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: List.generate(
                                                  hour.length, (hourIndex) {
                                                final hourItem =
                                                    hour[hourIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (widget.lockedDates!
                                                            .where((e) =>
                                                                (e.date ==
                                                                    dayItem) &&
                                                                (e.hour ==
                                                                    hourItem))
                                                            .toList()
                                                            .length <=
                                                        0) {
                                                      _model.selectedTimeSlot =
                                                          hourItem;
                                                      _model.selectedDate =
                                                          dayItem;
                                                      setState(() {});
                                                    }
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: () {
                                                        if (widget.lockedDates!
                                                                .where((e) =>
                                                                    (e.date ==
                                                                        dayItem) &&
                                                                    (e.hour ==
                                                                        hourItem))
                                                                .toList()
                                                                .length >
                                                            0) {
                                                          return Color(
                                                              0xFFFF4769);
                                                        } else if ((_model
                                                                    .selectedTimeSlot ==
                                                                hourItem) &&
                                                            (_model.selectedDate ==
                                                                dayItem)) {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary;
                                                        } else {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .lightGray1;
                                                        }
                                                      }(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  4.0,
                                                                  8.0,
                                                                  4.0),
                                                      child: Text(
                                                        hourItem,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                }).divide(SizedBox(height: 20.0)),
                              );
                            },
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 28.0, 0.0, 0.0),
                              child: Text(
                                'Предпочтительный формат звонка',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 100),
                                  () => setState(() {}),
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText:
                                      'Телефон, Telegram , Zoom, Google Meet',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        color:
                                            FlutterFlowTheme.of(context).gray,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .lightGray1,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .lightGray1,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 14.0, 0.0, 14.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 32.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: ((_model.selectedDate == null) ||
                                          (_model.selectedTimeSlot == null ||
                                              _model.selectedTimeSlot == '') ||
                                          (_model.textController.text == null ||
                                              _model.textController.text == ''))
                                      ? null
                                      : () async {
                                          await widget.hr!.update({
                                            ...mapToFirestore(
                                              {
                                                'lockedDates':
                                                    FieldValue.arrayUnion([
                                                  getAvailableDatesFirestoreData(
                                                    updateAvailableDatesStruct(
                                                      AvailableDatesStruct(
                                                        date:
                                                            _model.selectedDate,
                                                        hour: _model
                                                            .selectedTimeSlot,
                                                        name:
                                                            'Собеседование с ${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.surname, '')}',
                                                        applicant:
                                                            currentUserReference,
                                                        hr: widget.hr,
                                                      ),
                                                      clearUnsetFields: false,
                                                    ),
                                                    true,
                                                  )
                                                ]),
                                              },
                                            ),
                                          });
                                          unawaited(
                                            () async {
                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'lockedDates':
                                                        FieldValue.arrayUnion([
                                                      getAvailableDatesFirestoreData(
                                                        updateAvailableDatesStruct(
                                                          AvailableDatesStruct(
                                                            date: _model
                                                                .selectedDate,
                                                            hour: _model
                                                                .selectedTimeSlot,
                                                            applicant:
                                                                currentUserReference,
                                                            hr: widget.hr,
                                                            name: _model
                                                                .textController
                                                                .text,
                                                          ),
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                        true,
                                                      )
                                                    ]),
                                                  },
                                                ),
                                              });
                                            }(),
                                          );
                                          unawaited(
                                            () async {
                                              await widget.response!.update(
                                                  createResponseRecordData(
                                                isInterviewDateSelected: true,
                                              ));
                                            }(),
                                          );
                                          unawaited(
                                            () async {
                                              await NotificationsRecord
                                                  .collection
                                                  .doc()
                                                  .set({
                                                ...createNotificationsRecordData(
                                                  from: widget.hr,
                                                  to: currentUserReference,
                                                  type: 'Напоминание',
                                                  text:
                                                      'У вас назначено видео-интервью на ${'${dateTimeFormat(
                                                    'dd MMMM (EEEE)',
                                                    _model.selectedDate,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )} в ${_model.selectedTimeSlot}'}. Ждём вас!',
                                                  isViewed: false,
                                                  response: widget.response,
                                                  vacancy: widget.vacancy,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'created_time': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                            }(),
                                          );
                                          unawaited(
                                            () async {
                                              await NotificationsRecord
                                                  .collection
                                                  .doc()
                                                  .set({
                                                ...createNotificationsRecordData(
                                                  from: currentUserReference,
                                                  to: widget.hr,
                                                  type: 'Напоминание',
                                                  text:
                                                      'Кандидат выбрал удобное время для интервью, ${'${dateTimeFormat(
                                                    'dd MMMM (EEEE)',
                                                    _model.selectedDate,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )} в ${_model.selectedTimeSlot}'}. Cпособ связи: ${_model.textController.text}',
                                                  isViewed: false,
                                                  response: widget.response,
                                                  vacancy: widget.vacancy,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'created_time': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                            }(),
                                          );
                                          Navigator.pop(context);

                                          FFAppState().update(() {});
                                          showDialog(
                                            barrierColor:
                                                FlutterFlowTheme.of(context)
                                                    .modalBgnd,
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: InfoMessageWidget(
                                                  text:
                                                      'Вы записались на интервью',
                                                  isError: false,
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                  text: 'Записаться',
                                  options: FFButtonOptions(
                                    width: 200.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
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
                                    borderRadius: BorderRadius.circular(8.0),
                                    disabledColor:
                                        FlutterFlowTheme.of(context).gray,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
