import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/header_mobile_close/header_mobile_close_widget.dart';
import '/profile/profile_components/upload_resume/upload_resume_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'burger_mobile_model.dart';
export 'burger_mobile_model.dart';

class BurgerMobileWidget extends StatefulWidget {
  const BurgerMobileWidget({
    super.key,
    required this.page,
  });

  final int? page;

  @override
  State<BurgerMobileWidget> createState() => _BurgerMobileWidgetState();
}

class _BurgerMobileWidgetState extends State<BurgerMobileWidget> {
  late BurgerMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BurgerMobileModel());

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          wrapWithModel(
            model: _model.headerMobileCloseModel,
            updateCallback: () => setState(() {}),
            child: HeaderMobileCloseWidget(
              currentPage: 10,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 67.0, 0.0, 0.0),
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
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: widget.page == 1
                          ? FlutterFlowTheme.of(context).primaryText
                          : FlutterFlowTheme.of(context).gray,
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('VacancyList_applicant');
              },
              child: Text(
                'Вакансии',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: widget.page == 2
                          ? FlutterFlowTheme.of(context).primaryText
                          : FlutterFlowTheme.of(context).gray,
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
          ),
          if (valueOrDefault(currentUserDocument?.role, '') == 'applicant')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 0.0, 0.0),
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
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: widget.page == 3
                              ? FlutterFlowTheme.of(context).primaryText
                              : FlutterFlowTheme.of(context).gray,
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ),
            ),
          if (valueOrDefault(currentUserDocument?.role, '') == 'hr')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 0.0, 0.0),
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
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: widget.page == 3
                              ? FlutterFlowTheme.of(context).primaryText
                              : FlutterFlowTheme.of(context).gray,
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ),
            ),
          if (valueOrDefault(currentUserDocument?.role, '') == 'hr')
            Builder(
              builder: (context) => Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 36.0, 16.0, 0.0),
                child: AuthUserStreamWidget(
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
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: UploadResumeWidget(),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).darkBlue,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FFIcons.kdownload,
                              color: FlutterFlowTheme.of(context).darkBlue,
                              size: 24.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Загрузить резюме',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
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
            ),
        ],
      ),
    );
  }
}
