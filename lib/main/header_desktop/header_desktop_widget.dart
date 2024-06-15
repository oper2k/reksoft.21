import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/placeholders/notify_icon_placeholder/notify_icon_placeholder_widget.dart';
import '/profile/profile_components/upload_resume/upload_resume_widget.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_desktop_model.dart';
export 'header_desktop_model.dart';

class HeaderDesktopWidget extends StatefulWidget {
  const HeaderDesktopWidget({
    super.key,
    required this.page,
  });

  final String? page;

  @override
  State<HeaderDesktopWidget> createState() => _HeaderDesktopWidgetState();
}

class _HeaderDesktopWidgetState extends State<HeaderDesktopWidget> {
  late HeaderDesktopModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderDesktopModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
      ),
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              valueOrDefault<double>(
                () {
                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                    return 0.0;
                  } else if (MediaQuery.sizeOf(context).width <
                      kBreakpointMedium) {
                    return 20.0;
                  } else if (MediaQuery.sizeOf(context).width <
                      kBreakpointLarge) {
                    return 20.0;
                  } else {
                    return 120.0;
                  }
                }(),
                0.0,
              ),
              0.0,
              valueOrDefault<double>(
                () {
                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                    return 0.0;
                  } else if (MediaQuery.sizeOf(context).width <
                      kBreakpointMedium) {
                    return 20.0;
                  } else if (MediaQuery.sizeOf(context).width <
                      kBreakpointLarge) {
                    return 20.0;
                  } else {
                    return 120.0;
                  }
                }(),
                0.0,
              ),
              0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/logo.png.png',
                width: 116.0,
                height: 24.0,
                fit: BoxFit.contain,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('News_all');
                      },
                      child: Text(
                        'Новости',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .headlineMediumFamily,
                              color: valueOrDefault<Color>(
                                widget.page == 'news'
                                    ? FlutterFlowTheme.of(context).primaryText
                                    : FlutterFlowTheme.of(context).gray,
                                FlutterFlowTheme.of(context).gray,
                              ),
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .headlineMediumFamily),
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (valueOrDefault(currentUserDocument?.role, '') ==
                            'hr') {
                          context.pushNamed('VacancyList_hr');
                        } else if (valueOrDefault(
                                currentUserDocument?.role, '') ==
                            'applicant') {
                          context.pushNamed('VacancyList_applicant');
                        } else {
                          context.pushNamed('VacancyList_applicant');
                        }
                      },
                      child: Text(
                        'Вакансии',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .headlineMediumFamily,
                              color: valueOrDefault<Color>(
                                widget.page == 'vacancy'
                                    ? FlutterFlowTheme.of(context).primaryText
                                    : FlutterFlowTheme.of(context).gray,
                                FlutterFlowTheme.of(context).gray,
                              ),
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .headlineMediumFamily),
                            ),
                      ),
                    ),
                  ),
                  if (valueOrDefault(currentUserDocument?.role, '') ==
                      'applicant')
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('My_Responses');
                          },
                          child: Text(
                            'Мои отклики',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineMediumFamily,
                                  color: valueOrDefault<Color>(
                                    widget.page == 'response'
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : FlutterFlowTheme.of(context).gray,
                                    FlutterFlowTheme.of(context).gray,
                                  ),
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineMediumFamily),
                                ),
                          ),
                        ),
                      ),
                    ),
                  if (valueOrDefault(currentUserDocument?.role, '') == 'hr')
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('HR_Candidates');
                          },
                          child: Text(
                            'Кандидаты',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineMediumFamily,
                                  color: valueOrDefault<Color>(
                                    widget.page == 'candidate'
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : FlutterFlowTheme.of(context).gray,
                                    FlutterFlowTheme.of(context).gray,
                                  ),
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineMediumFamily),
                                ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if ((valueOrDefault(currentUserDocument?.role, '') ==
                          'applicant') &&
                      responsiveVisibility(
                        context: context,
                        phone: false,
                      ))
                    Builder(
                      builder: (context) => AuthUserStreamWidget(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
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
                                  child: UploadResumeWidget(),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          child: Container(
                            height: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).darkBlue,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  22.0, 0.0, 22.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_download,
                                    color:
                                        FlutterFlowTheme.of(context).darkBlue,
                                    size: 24.0,
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    tablet: false,
                                    tabletLandscape: false,
                                  ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Загрузить резюме',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(FlutterFlowTheme
                                                          .of(context)
                                                      .headlineMediumFamily),
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 8.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('Notifications');
                      },
                      child: Container(
                        width: 42.0,
                        height: 42.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FutureBuilder<int>(
                          future: queryNotificationsRecordCount(
                            queryBuilder: (notificationsRecord) =>
                                notificationsRecord
                                    .where(
                                      'to',
                                      isEqualTo: currentUserReference,
                                    )
                                    .where(
                                      'isViewed',
                                      isNotEqualTo: true,
                                    ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return NotifyIconPlaceholderWidget(
                                color: widget.page == 'notify'
                                    ? FlutterFlowTheme.of(context).primaryText
                                    : FlutterFlowTheme.of(context).gray,
                              );
                            }
                            int badgeCount = snapshot.data!;
                            return badges.Badge(
                              badgeContent: Text(
                                valueOrDefault<String>(
                                  badgeCount.toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                              ),
                              showBadge: badgeCount > 0,
                              shape: badges.BadgeShape.circle,
                              badgeColor: FlutterFlowTheme.of(context).primary,
                              elevation: 0.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 6.0, 6.0, 6.0),
                              position: badges.BadgePosition.topEnd(),
                              animationType: badges.BadgeAnimationType.scale,
                              toAnimate: true,
                              child: wrapWithModel(
                                model: _model.notifyIconPlaceholderModel,
                                updateCallback: () => setState(() {}),
                                child: NotifyIconPlaceholderWidget(
                                  color: widget.page == 'notify'
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context).gray,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('Profile');
                    },
                    child: Container(
                      width: 42.0,
                      height: 42.0,
                      decoration: BoxDecoration(),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.person,
                        color: valueOrDefault<Color>(
                          widget.page == 'profile'
                              ? FlutterFlowTheme.of(context).primaryText
                              : FlutterFlowTheme.of(context).gray,
                          FlutterFlowTheme.of(context).gray,
                        ),
                        size: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
