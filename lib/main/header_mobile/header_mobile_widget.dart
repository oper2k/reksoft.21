import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/burger_mobile/burger_mobile_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_mobile_model.dart';
export 'header_mobile_model.dart';

class HeaderMobileWidget extends StatefulWidget {
  const HeaderMobileWidget({
    super.key,
    required this.currentPage,
  });

  final int? currentPage;

  @override
  State<HeaderMobileWidget> createState() => _HeaderMobileWidgetState();
}

class _HeaderMobileWidgetState extends State<HeaderMobileWidget> {
  late HeaderMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderMobileModel());

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
                Image.asset(
                  'assets/images/logo.png.png',
                  height: 20.0,
                  fit: BoxFit.cover,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AuthUserStreamWidget(
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
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: FlutterFlowTheme.of(context).gray,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
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
                        context.pushNamed('Notifications');
                      },
                      child: Icon(
                        Icons.notifications_sharp,
                        color: FlutterFlowTheme.of(context).gray,
                        size: 24.0,
                      ),
                    ),
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
                                height: MediaQuery.sizeOf(context).height * 1.0,
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
                  ].divide(SizedBox(width: 6.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
