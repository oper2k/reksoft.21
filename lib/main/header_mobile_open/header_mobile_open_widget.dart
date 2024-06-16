import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/burger_mobile/burger_mobile_widget.dart';
import '/placeholders/notify_icon_placeholder/notify_icon_placeholder_widget.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_mobile_open_model.dart';
export 'header_mobile_open_model.dart';

class HeaderMobileOpenWidget extends StatefulWidget {
  const HeaderMobileOpenWidget({
    super.key,
    required this.currentPage,
  });

  final int? currentPage;

  @override
  State<HeaderMobileOpenWidget> createState() => _HeaderMobileOpenWidgetState();
}

class _HeaderMobileOpenWidgetState extends State<HeaderMobileOpenWidget> {
  late HeaderMobileOpenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderMobileOpenModel());

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
        tablet: false,
        tabletLandscape: false,
        desktop: false,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 38.0, 0.0, 0.0),
        child: Container(
          width: double.infinity,
          height: 46.0,
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('News_all');
                  },
                  child: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/images/logo_white.png'
                        : 'assets/images/logo.png.png',
                    height: 20.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (!loggedIn) {
                                  context.goNamed('Sign_In');
                                }
                              },
                              child: Text(
                                loggedIn ? currentUserDisplayName : 'Войти',
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: FlutterFlowTheme.of(context).gray,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                              ),
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
                        child: Icon(
                          FFIcons.kperson,
                          color: widget.currentPage == 4
                              ? FlutterFlowTheme.of(context).primaryText
                              : FlutterFlowTheme.of(context).gray,
                          size: 24.0,
                        ),
                      ),
                      InkWell(
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
                                return NotifyIconPlaceholderWidget();
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
                                badgeColor:
                                    FlutterFlowTheme.of(context).primary,
                                elevation: 0.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 6.0, 6.0, 6.0),
                                position: badges.BadgePosition.topEnd(),
                                animationType: badges.BadgeAnimationType.scale,
                                toAnimate: true,
                                child: Icon(
                                  FFIcons.knotifications,
                                  color: widget.currentPage == 0
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context).gray,
                                  size: 24.0,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      child: BurgerMobileWidget(
                                        page: widget.currentPage!,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Icon(
                              Icons.menu_rounded,
                              color: FlutterFlowTheme.of(context).gray,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(width: 6.0)),
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
