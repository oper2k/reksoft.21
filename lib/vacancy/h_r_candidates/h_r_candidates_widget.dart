import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main/footer/footer_widget.dart';
import '/main/header_desktop/header_desktop_widget.dart';
import '/main/header_mobile_open/header_mobile_open_widget.dart';
import '/main/info_message/info_message_widget.dart';
import '/placeholders/empty_responses_list/empty_responses_list_widget.dart';
import '/vacancy/vacancy_components/accept_applicant/accept_applicant_widget.dart';
import '/vacancy/vacancy_components/response_accept/response_accept_widget.dart';
import '/vacancy/vacancy_components/response_decline/response_decline_widget.dart';
import '/vacancy/vacancy_components/resume_a_iresults/resume_a_iresults_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'h_r_candidates_model.dart';
export 'h_r_candidates_model.dart';

class HRCandidatesWidget extends StatefulWidget {
  const HRCandidatesWidget({
    super.key,
    this.vacancy,
  });

  final DocumentReference? vacancy;

  @override
  State<HRCandidatesWidget> createState() => _HRCandidatesWidgetState();
}

class _HRCandidatesWidgetState extends State<HRCandidatesWidget>
    with TickerProviderStateMixin {
  late HRCandidatesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HRCandidatesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          if (valueOrDefault(currentUserDocument?.role, '') == 'hr') {
            return;
          }

          context.safePop();
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
                child: GestureDetector(
                  onTap: () => _model.unfocusNode.canRequestFocus
                      ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                      : FocusScope.of(context).unfocus(),
                  child: InfoMessageWidget(
                    text:
                        'Извините, у вас не хватает прав для просмотра этой страницы',
                    isError: true,
                  ),
                ),
              );
            },
          ).then((value) => setState(() {}));
        }),
        Future(() async {
          if (widget.vacancy != null) {
            _model.vacancyFilter = widget.vacancy?.id;
            setState(() {});
            setState(() {
              _model.vacancyFilterValueController?.value = widget.vacancy!.id;
            });
          }
        }),
      ]);
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 1440.0,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        wrapWithModel(
                          model: _model.headerDesktopModel,
                          updateCallback: () => setState(() {}),
                          child: HeaderDesktopWidget(
                            page: 'candidate',
                          ),
                        ),
                        wrapWithModel(
                          model: _model.headerMobileOpenModel,
                          updateCallback: () => setState(() {}),
                          child: HeaderMobileOpenWidget(
                            currentPage: 3,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                valueOrDefault<double>(
                                  () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 16.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 20.0;
                                    } else {
                                      return 120.0;
                                    }
                                  }(),
                                  0.0,
                                ),
                                valueOrDefault<double>(
                                  () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 8.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 14.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 14.0;
                                    } else {
                                      return 26.0;
                                    }
                                  }(),
                                  0.0,
                                ),
                                valueOrDefault<double>(
                                  () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 16.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 20.0;
                                    } else {
                                      return 120.0;
                                    }
                                  }(),
                                  0.0,
                                ),
                                0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Кандидаты',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                        tabletLandscape: false,
                                      ))
                                        Expanded(
                                          child: Container(
                                            width: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 479.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 479.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 479.0;
                                              } else {
                                                return 788.0;
                                              }
                                            }(),
                                            height: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 20.0),
                                                    child: FutureBuilder<
                                                        List<VacanciesRecord>>(
                                                      future:
                                                          queryVacanciesRecordOnce(
                                                        queryBuilder:
                                                            (vacanciesRecord) =>
                                                                vacanciesRecord
                                                                    .where(
                                                                      'creator',
                                                                      isEqualTo:
                                                                          currentUserReference,
                                                                    )
                                                                    .where(
                                                                      'is_Deleted',
                                                                      isNotEqualTo:
                                                                          true,
                                                                    ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 15.0,
                                                              height: 15.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<VacanciesRecord>
                                                            vacancyFilterVacanciesRecordList =
                                                            snapshot.data!;
                                                        return FlutterFlowDropDown<
                                                            String>(
                                                          controller: _model
                                                                  .vacancyFilterValueController ??=
                                                              FormFieldController<
                                                                  String>(
                                                            _model.vacancyFilterValue ??=
                                                                '',
                                                          ),
                                                          options: List<
                                                                  String>.from(
                                                              vacancyFilterVacanciesRecordList
                                                                  .map((e) => e
                                                                      .reference
                                                                      .id)
                                                                  .toList()),
                                                          optionLabels:
                                                              vacancyFilterVacanciesRecordList
                                                                  .map((e) => e
                                                                      .jobTitle)
                                                                  .toList(),
                                                          onChanged:
                                                              (val) async {
                                                            setState(() => _model
                                                                    .vacancyFilterValue =
                                                                val);
                                                            _model.vacancyFilter =
                                                                _model
                                                                    .vacancyFilterValue;
                                                            setState(() {});
                                                          },
                                                          width: 350.0,
                                                          height: 56.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                          hintText:
                                                              'Все вакансии',
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .gray,
                                                            size: 24.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          elevation: 2.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .lightGray1,
                                                          borderWidth: 2.0,
                                                          borderRadius: 6.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      4.0,
                                                                      16.0,
                                                                      4.0),
                                                          hidesUnderline: true,
                                                          isOverButton: true,
                                                          isSearchable: false,
                                                          isMultiSelect: false,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
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
                                                        _model.responseFilter =
                                                            'На рассмотрении';
                                                        setState(() {});
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                children: [
                                                                  Container(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              10.0,
                                                                          color:
                                                                              Color(0x0826334D),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lightGray1,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (_model
                                                                          .responseFilter ==
                                                                      'На рассмотрении')
                                                                    Container(
                                                                      width:
                                                                          14.0,
                                                                      height:
                                                                          14.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation1']!),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Неразобранные отклики',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
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
                                                        _model.responseFilter =
                                                            'Приглашение на вводное интервью';
                                                        setState(() {});
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                children: [
                                                                  Container(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              10.0,
                                                                          color:
                                                                              Color(0x0826334D),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lightGray1,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (_model
                                                                          .responseFilter ==
                                                                      'Приглашение на вводное интервью')
                                                                    Container(
                                                                      width:
                                                                          14.0,
                                                                      height:
                                                                          14.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation2']!),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Пригласили на вводное интервью',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
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
                                                        _model.responseFilter =
                                                            'Прошел вводное интервью';
                                                        setState(() {});
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                children: [
                                                                  Container(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              10.0,
                                                                          color:
                                                                              Color(0x0826334D),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lightGray1,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (_model
                                                                          .responseFilter ==
                                                                      'Прошел вводное интервью')
                                                                    Container(
                                                                      width:
                                                                          14.0,
                                                                      height:
                                                                          14.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation3']!),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Прошел вводное интервью',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
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
                                                        _model.responseFilter =
                                                            'Приглашение';
                                                        setState(() {});
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                children: [
                                                                  Container(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              10.0,
                                                                          color:
                                                                              Color(0x0826334D),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lightGray1,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (_model
                                                                          .responseFilter ==
                                                                      'Приглашение')
                                                                    Container(
                                                                      width:
                                                                          14.0,
                                                                      height:
                                                                          14.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation4']!),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Пригласили на интервью',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
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
                                                        _model.responseFilter =
                                                            'Приглашение на работу';
                                                        setState(() {});
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                children: [
                                                                  Container(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              10.0,
                                                                          color:
                                                                              Color(0x0826334D),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lightGray1,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (_model
                                                                          .responseFilter ==
                                                                      'Приглашение на работу')
                                                                    Container(
                                                                      width:
                                                                          14.0,
                                                                      height:
                                                                          14.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation5']!),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Пригласили на работу',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
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
                                                        _model.responseFilter =
                                                            'Отказ';
                                                        setState(() {});
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                children: [
                                                                  Container(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              10.0,
                                                                          color:
                                                                              Color(0x0826334D),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lightGray1,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (_model
                                                                          .responseFilter ==
                                                                      'Отказ')
                                                                    Container(
                                                                      width:
                                                                          14.0,
                                                                      height:
                                                                          14.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation6']!),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Отказано',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          setState(() {
                                                            _model
                                                                .vacancyFilterValueController
                                                                ?.reset();
                                                          });
                                                          _model.responseFilter =
                                                              null;
                                                          _model.vacancyFilter =
                                                              null;
                                                          setState(() {});
                                                        },
                                                        text:
                                                            'Сбросить фильтры',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].addToEnd(
                                                    SizedBox(height: 60.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      Flexible(
                                        child:
                                            StreamBuilder<List<ResponseRecord>>(
                                          stream: queryResponseRecord(
                                            queryBuilder: (responseRecord) =>
                                                responseRecord
                                                    .where(
                                                      'hr',
                                                      isEqualTo:
                                                          currentUserReference,
                                                    )
                                                    .where(
                                                      'status',
                                                      isEqualTo:
                                                          _model.responseFilter !=
                                                                  ''
                                                              ? _model
                                                                  .responseFilter
                                                              : null,
                                                    )
                                                    .where(
                                                      'vacancy',
                                                      isEqualTo: functions
                                                          .stringToDocReference(
                                                              _model
                                                                  .vacancyFilter),
                                                    )
                                                    .orderBy('created_time',
                                                        descending: true),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 15.0,
                                                  height: 15.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ResponseRecord>
                                                containerResponseRecordList =
                                                snapshot.data!;
                                            return Container(
                                              constraints: BoxConstraints(
                                                maxWidth: 788.0,
                                              ),
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Найдено: ${valueOrDefault<String>(
                                                      containerResponseRecordList
                                                          .length
                                                          .toString(),
                                                      '0',
                                                    )}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  18.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final resp =
                                                              containerResponseRecordList
                                                                  .toList();
                                                          if (resp.isEmpty) {
                                                            return EmptyResponsesListWidget();
                                                          }
                                                          return SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: List.generate(
                                                                      resp.length,
                                                                      (respIndex) {
                                                                final respItem =
                                                                    resp[
                                                                        respIndex];
                                                                return StreamBuilder<
                                                                    UsersRecord>(
                                                                  stream: UsersRecord
                                                                      .getDocument(
                                                                          respItem
                                                                              .applicant!),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              15.0,
                                                                          height:
                                                                              15.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final containerUsersRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(24.0),
                                                                      ),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          StreamBuilder<
                                                                              VacanciesRecord>(
                                                                            stream:
                                                                                VacanciesRecord.getDocument(respItem.vacancy!),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 15.0,
                                                                                    height: 15.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              final containerVacanciesRecord = snapshot.data!;
                                                                              return Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(40.0, 32.0, 40.0, 32.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  context.pushNamed(
                                                                                                    'Vacancy_fullInfo',
                                                                                                    queryParameters: {
                                                                                                      'vacancy': serializeParam(
                                                                                                        containerVacanciesRecord,
                                                                                                        ParamType.Document,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                    extra: <String, dynamic>{
                                                                                                      'vacancy': containerVacanciesRecord,
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: () {
                                                                                                      if (respItem.status == 'Приглашение на работу') {
                                                                                                        return FlutterFlowTheme.of(context).secondary;
                                                                                                      } else if (respItem.status == 'Отказ') {
                                                                                                        return FlutterFlowTheme.of(context).error;
                                                                                                      } else {
                                                                                                        return FlutterFlowTheme.of(context).warning;
                                                                                                      }
                                                                                                    }(),
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                  ),
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 8.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Flexible(
                                                                                                              child: Text(
                                                                                                                containerVacanciesRecord.jobTitle,
                                                                                                                maxLines: 2,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                      color: FlutterFlowTheme.of(context).white,
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Text(
                                                                                                          functions.createSalaryText(containerVacanciesRecord.salaryMin, containerVacanciesRecord.salaryMax),
                                                                                                          style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(height: 4.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            context.pushNamed(
                                                                                              'userFullInfo',
                                                                                              queryParameters: {
                                                                                                'candidat': serializeParam(
                                                                                                  containerUsersRecord,
                                                                                                  ParamType.Document,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                              extra: <String, dynamic>{
                                                                                                'candidat': containerUsersRecord,
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                child: Container(
                                                                                                  width: 80.0,
                                                                                                  height: 80.0,
                                                                                                  clipBehavior: Clip.antiAlias,
                                                                                                  decoration: BoxDecoration(
                                                                                                    shape: BoxShape.circle,
                                                                                                  ),
                                                                                                  child: CachedNetworkImage(
                                                                                                    fadeInDuration: Duration(milliseconds: 100),
                                                                                                    fadeOutDuration: Duration(milliseconds: 100),
                                                                                                    imageUrl: getCORSProxyUrl(
                                                                                                      valueOrDefault<String>(
                                                                                                        containerUsersRecord.photoUrl,
                                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/reksoft-21-46uzyi/assets/tvzhht4sf47d/photo_placeholder_new.webp',
                                                                                                      ),
                                                                                                    ),
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      '${containerUsersRecord.displayName} ${containerUsersRecord.surname}',
                                                                                                      'Кандидат',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                                          fontSize: 20.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Image.asset(
                                                                                                        'assets/images/place.png',
                                                                                                        width: 14.0,
                                                                                                        height: 14.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            containerUsersRecord.city,
                                                                                                            'Город не указан',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ].divide(SizedBox(height: 12.0)),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).lightGray1,
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(18.0, 12.0, 18.0, 12.0),
                                                                                            child: Text(
                                                                                              'Статус: ${() {
                                                                                                if (respItem.status == 'Приглашение') {
                                                                                                  return 'Пригласили на интервью';
                                                                                                } else if (respItem.status == 'Отказ') {
                                                                                                  return 'Отказали';
                                                                                                } else if (respItem.status == 'Прошел вводное интервью') {
                                                                                                  return 'Прошел интервью';
                                                                                                } else if (respItem.status == 'Приглашение на вводное интервью') {
                                                                                                  return 'Пригласили на вводное интервью';
                                                                                                } else if (respItem.status == 'На рассмотрении') {
                                                                                                  return 'Ожидает решения';
                                                                                                } else {
                                                                                                  return respItem.status;
                                                                                                }
                                                                                              }()}',
                                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Builder(
                                                                                              builder: (context) => FlutterFlowIconButton(
                                                                                                borderColor: Colors.transparent,
                                                                                                borderRadius: 20.0,
                                                                                                borderWidth: 0.0,
                                                                                                buttonSize: 48.0,
                                                                                                fillColor: FlutterFlowTheme.of(context).lightGray1,
                                                                                                icon: Icon(
                                                                                                  FFIcons.ktalk,
                                                                                                  color: FlutterFlowTheme.of(context).blueNight,
                                                                                                  size: 26.0,
                                                                                                ),
                                                                                                onPressed: () async {
                                                                                                  _model.isChatExist = await queryChatsRecordCount(
                                                                                                    queryBuilder: (chatsRecord) => chatsRecord
                                                                                                        .where(
                                                                                                          'user_b',
                                                                                                          isEqualTo: containerUsersRecord.reference,
                                                                                                        )
                                                                                                        .where(
                                                                                                          'user_a',
                                                                                                          isEqualTo: currentUserReference,
                                                                                                        ),
                                                                                                  );
                                                                                                  if (_model.isChatExist! > 0) {
                                                                                                    _model.chatDoc = await queryChatsRecordOnce(
                                                                                                      queryBuilder: (chatsRecord) => chatsRecord
                                                                                                          .where(
                                                                                                            'user_b',
                                                                                                            isEqualTo: containerUsersRecord.reference,
                                                                                                          )
                                                                                                          .where(
                                                                                                            'user_a',
                                                                                                            isEqualTo: currentUserReference,
                                                                                                          ),
                                                                                                      singleRecord: true,
                                                                                                    ).then((s) => s.firstOrNull);

                                                                                                    context.pushNamed(
                                                                                                      'chat_2_Details',
                                                                                                      queryParameters: {
                                                                                                        'chatRef': serializeParam(
                                                                                                          _model.chatDoc,
                                                                                                          ParamType.Document,
                                                                                                        ),
                                                                                                        'recipient': serializeParam(
                                                                                                          containerUsersRecord.reference,
                                                                                                          ParamType.DocumentReference,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                      extra: <String, dynamic>{
                                                                                                        'chatRef': _model.chatDoc,
                                                                                                      },
                                                                                                    );
                                                                                                  } else {
                                                                                                    var chatsRecordReference = ChatsRecord.collection.doc();
                                                                                                    await chatsRecordReference.set({
                                                                                                      ...createChatsRecordData(
                                                                                                        userA: currentUserReference,
                                                                                                        userB: containerUsersRecord.reference,
                                                                                                        lastMessageTime: getCurrentTimestamp,
                                                                                                        lastMessageSentBy: currentUserReference,
                                                                                                        lastMessage: 'Рекрутер ${'${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.surname, '')}'} начал(а) чат',
                                                                                                      ),
                                                                                                      ...mapToFirestore(
                                                                                                        {
                                                                                                          'users': functions.returnUsersReferenceList(currentUserReference!, containerUsersRecord.reference),
                                                                                                          'last_message_seen_by': [currentUserReference],
                                                                                                        },
                                                                                                      ),
                                                                                                    });
                                                                                                    _model.createdChat = ChatsRecord.getDocumentFromData({
                                                                                                      ...createChatsRecordData(
                                                                                                        userA: currentUserReference,
                                                                                                        userB: containerUsersRecord.reference,
                                                                                                        lastMessageTime: getCurrentTimestamp,
                                                                                                        lastMessageSentBy: currentUserReference,
                                                                                                        lastMessage: 'Рекрутер ${'${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.surname, '')}'} начал(а) чат',
                                                                                                      ),
                                                                                                      ...mapToFirestore(
                                                                                                        {
                                                                                                          'users': functions.returnUsersReferenceList(currentUserReference!, containerUsersRecord.reference),
                                                                                                          'last_message_seen_by': [currentUserReference],
                                                                                                        },
                                                                                                      ),
                                                                                                    }, chatsRecordReference);

                                                                                                    context.pushNamed(
                                                                                                      'chat_2_Details',
                                                                                                      queryParameters: {
                                                                                                        'chatRef': serializeParam(
                                                                                                          _model.createdChat,
                                                                                                          ParamType.Document,
                                                                                                        ),
                                                                                                        'recipient': serializeParam(
                                                                                                          containerUsersRecord.reference,
                                                                                                          ParamType.DocumentReference,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                      extra: <String, dynamic>{
                                                                                                        'chatRef': _model.createdChat,
                                                                                                      },
                                                                                                    );

                                                                                                    showDialog(
                                                                                                      barrierColor: FlutterFlowTheme.of(context).modalBgnd,
                                                                                                      context: context,
                                                                                                      builder: (dialogContext) {
                                                                                                        return Dialog(
                                                                                                          elevation: 0,
                                                                                                          insetPadding: EdgeInsets.zero,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                          child: GestureDetector(
                                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                            child: InfoMessageWidget(
                                                                                                              text: 'Вы создали чат с кандидатом',
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => setState(() {}));
                                                                                                  }

                                                                                                  setState(() {});
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                            if (containerUsersRecord.resumeSummary != null && containerUsersRecord.resumeSummary != '')
                                                                                              Builder(
                                                                                                builder: (context) => FlutterFlowIconButton(
                                                                                                  borderRadius: 20.0,
                                                                                                  borderWidth: 0.0,
                                                                                                  buttonSize: 48.0,
                                                                                                  fillColor: FlutterFlowTheme.of(context).lightGray1,
                                                                                                  icon: FaIcon(
                                                                                                    FontAwesomeIcons.robot,
                                                                                                    color: FlutterFlowTheme.of(context).blueNight,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    await showDialog(
                                                                                                      barrierColor: FlutterFlowTheme.of(context).modalBgnd,
                                                                                                      context: context,
                                                                                                      builder: (dialogContext) {
                                                                                                        return Dialog(
                                                                                                          elevation: 0,
                                                                                                          insetPadding: EdgeInsets.zero,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                          child: GestureDetector(
                                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                            child: ResumeAIresultsWidget(
                                                                                                              user: containerUsersRecord,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => setState(() {}));
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            if (respItem.resume != null && respItem.resume != '')
                                                                                              FlutterFlowIconButton(
                                                                                                borderColor: Colors.transparent,
                                                                                                borderRadius: 20.0,
                                                                                                borderWidth: 0.0,
                                                                                                buttonSize: 48.0,
                                                                                                fillColor: FlutterFlowTheme.of(context).lightGray1,
                                                                                                icon: Icon(
                                                                                                  Icons.document_scanner_outlined,
                                                                                                  color: FlutterFlowTheme.of(context).blueNight,
                                                                                                  size: 26.0,
                                                                                                ),
                                                                                                onPressed: () async {
                                                                                                  await launchURL(respItem.resume);
                                                                                                },
                                                                                              ),
                                                                                            FlutterFlowIconButton(
                                                                                              borderColor: Colors.transparent,
                                                                                              borderRadius: 20.0,
                                                                                              borderWidth: 0.0,
                                                                                              buttonSize: 48.0,
                                                                                              fillColor: FlutterFlowTheme.of(context).lightGray1,
                                                                                              icon: Icon(
                                                                                                FFIcons.kemail,
                                                                                                color: FlutterFlowTheme.of(context).blueNight,
                                                                                                size: 26.0,
                                                                                              ),
                                                                                              onPressed: () async {
                                                                                                await launchUrl(Uri(
                                                                                                    scheme: 'mailto',
                                                                                                    path: containerUsersRecord.email,
                                                                                                    query: {
                                                                                                      'subject': containerVacanciesRecord.jobTitle,
                                                                                                      'body': 'Здравствуйте. По поводу отклика на вакансию',
                                                                                                    }.entries.map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&')));
                                                                                              },
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 12.0)),
                                                                                        ),
                                                                                      ),
                                                                                      if (containerVacanciesRecord.isDeleted)
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'Вы не можете отправить приглашение, так как вакансия была удалена',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      if ((respItem.status == 'Приглашение') && !containerVacanciesRecord.isDeleted && (respItem.isInterviewDateSelected == false))
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'Ждём когда кандидат выберет дату интервью...',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      if ((respItem.status == 'На рассмотрении') && !respItem.isChatFinished && !containerVacanciesRecord.isDeleted)
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                                                                                          child: Wrap(
                                                                                            spacing: 20.0,
                                                                                            runSpacing: 16.0,
                                                                                            alignment: WrapAlignment.center,
                                                                                            crossAxisAlignment: WrapCrossAlignment.center,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.center,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Builder(
                                                                                                builder: (context) => FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await respItem.reference.update(createResponseRecordData(
                                                                                                      status: 'Приглашение на вводное интервью',
                                                                                                    ));

                                                                                                    await NotificationsRecord.collection.doc().set({
                                                                                                      ...createNotificationsRecordData(
                                                                                                        from: currentUserReference,
                                                                                                        to: containerUsersRecord.reference,
                                                                                                        type: 'Приглашение на вводное интервью',
                                                                                                        text: 'Здравствуйте. Вы откликались на вакансию \"${containerVacanciesRecord.jobTitle}\". Приглашаем вас на вводное интервью в чате. Нажмите на кнопку ниже чтобы начать чат.',
                                                                                                        isViewed: false,
                                                                                                        response: respItem.reference,
                                                                                                        vacancy: respItem.vacancy,
                                                                                                      ),
                                                                                                      ...mapToFirestore(
                                                                                                        {
                                                                                                          'created_time': FieldValue.serverTimestamp(),
                                                                                                        },
                                                                                                      ),
                                                                                                    });
                                                                                                    _model.apiResultnma = await SendEmailGroup.sendEmailCall.call(
                                                                                                      email: containerUsersRecord.email,
                                                                                                      name: '${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.surname, '')}',
                                                                                                      text: 'Здравствуйте. Вы откликались на должность ${containerVacanciesRecord.jobTitle}. Приглашаем вас пройти вводное интервью в нашем чате ',
                                                                                                    );

                                                                                                    Navigator.pop(context);
                                                                                                    showDialog(
                                                                                                      barrierColor: FlutterFlowTheme.of(context).modalBgnd,
                                                                                                      context: context,
                                                                                                      builder: (dialogContext) {
                                                                                                        return Dialog(
                                                                                                          elevation: 0,
                                                                                                          insetPadding: EdgeInsets.zero,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                          child: GestureDetector(
                                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                            child: InfoMessageWidget(
                                                                                                              text: 'Приглашение отправлено',
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => setState(() {}));

                                                                                                    setState(() {});
                                                                                                  },
                                                                                                  text: 'Пригласить на интервью',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 260.0,
                                                                                                    height: 50.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                          color: Colors.white,
                                                                                                          fontSize: 15.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                                                              Builder(
                                                                                                builder: (context) => InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    await showDialog(
                                                                                                      barrierColor: FlutterFlowTheme.of(context).modalBgnd,
                                                                                                      context: context,
                                                                                                      builder: (dialogContext) {
                                                                                                        return Dialog(
                                                                                                          elevation: 0,
                                                                                                          insetPadding: EdgeInsets.zero,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                          child: GestureDetector(
                                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                            child: ResponseDeclineWidget(
                                                                                                              response: respItem,
                                                                                                              vacancy: containerVacanciesRecord,
                                                                                                              user: containerUsersRecord,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => setState(() {}));
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    width: 260.0,
                                                                                                    height: 50.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      borderRadius: BorderRadius.circular(6.0),
                                                                                                    ),
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      'Отказать',
                                                                                                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      if ((respItem.status == 'Прошел вводное интервью') && !containerVacanciesRecord.isDeleted)
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                                                                                          child: Wrap(
                                                                                            spacing: 20.0,
                                                                                            runSpacing: 16.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Builder(
                                                                                                builder: (context) => FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await showDialog(
                                                                                                      barrierColor: FlutterFlowTheme.of(context).modalBgnd,
                                                                                                      context: context,
                                                                                                      builder: (dialogContext) {
                                                                                                        return Dialog(
                                                                                                          elevation: 0,
                                                                                                          insetPadding: EdgeInsets.zero,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                          child: GestureDetector(
                                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                            child: ResponseAcceptWidget(
                                                                                                              response: respItem,
                                                                                                              user: containerUsersRecord,
                                                                                                              vacancy: containerVacanciesRecord,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => setState(() {}));
                                                                                                  },
                                                                                                  text: 'Результаты интервью',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 260.0,
                                                                                                    height: 50.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                          color: Colors.white,
                                                                                                          fontSize: 15.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                                                              Builder(
                                                                                                builder: (context) => InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    await showDialog(
                                                                                                      barrierColor: FlutterFlowTheme.of(context).modalBgnd,
                                                                                                      context: context,
                                                                                                      builder: (dialogContext) {
                                                                                                        return Dialog(
                                                                                                          elevation: 0,
                                                                                                          insetPadding: EdgeInsets.zero,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                          child: GestureDetector(
                                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                            child: ResponseDeclineWidget(
                                                                                                              response: respItem,
                                                                                                              vacancy: containerVacanciesRecord,
                                                                                                              user: containerUsersRecord,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => setState(() {}));
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    width: 260.0,
                                                                                                    height: 50.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      borderRadius: BorderRadius.circular(6.0),
                                                                                                    ),
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      'Отказать',
                                                                                                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      if ((respItem.status == 'Приглашение') && !containerVacanciesRecord.isDeleted && (respItem.isInterviewDateSelected == true))
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                                                                                          child: Wrap(
                                                                                            spacing: 20.0,
                                                                                            runSpacing: 16.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Builder(
                                                                                                builder: (context) => FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await showDialog(
                                                                                                      barrierColor: FlutterFlowTheme.of(context).modalBgnd,
                                                                                                      context: context,
                                                                                                      builder: (dialogContext) {
                                                                                                        return Dialog(
                                                                                                          elevation: 0,
                                                                                                          insetPadding: EdgeInsets.zero,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                          child: GestureDetector(
                                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                            child: AcceptApplicantWidget(
                                                                                                              response: respItem,
                                                                                                              vacancy: containerVacanciesRecord,
                                                                                                              user: containerUsersRecord,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => setState(() {}));
                                                                                                  },
                                                                                                  text: 'Пригласить на работу',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 260.0,
                                                                                                    height: 50.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                          color: Colors.white,
                                                                                                          fontSize: 15.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                                                              Builder(
                                                                                                builder: (context) => InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    await showDialog(
                                                                                                      barrierColor: FlutterFlowTheme.of(context).modalBgnd,
                                                                                                      context: context,
                                                                                                      builder: (dialogContext) {
                                                                                                        return Dialog(
                                                                                                          elevation: 0,
                                                                                                          insetPadding: EdgeInsets.zero,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                          child: GestureDetector(
                                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                            child: ResponseDeclineWidget(
                                                                                                              response: respItem,
                                                                                                              vacancy: containerVacanciesRecord,
                                                                                                              user: containerUsersRecord,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => setState(() {}));
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    width: 260.0,
                                                                                                    height: 50.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      borderRadius: BorderRadius.circular(6.0),
                                                                                                    ),
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      'Отказать',
                                                                                                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              })
                                                                  .divide(SizedBox(
                                                                      height:
                                                                          18.0))
                                                                  .addToEnd(SizedBox(
                                                                      height:
                                                                          60.0)),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ].divide(SizedBox(width: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 0.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 28.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 28.0;
                                      } else {
                                        return 40.0;
                                      }
                                    }())),
                                  ),
                                ),
                              ].divide(SizedBox(height: 18.0)),
                            ),
                          ),
                        ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                        ))
                          wrapWithModel(
                            model: _model.footerModel,
                            updateCallback: () => setState(() {}),
                            child: FooterWidget(),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
