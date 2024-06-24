import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/info_message/info_message_widget.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'h_o_m_e_redirect_model.dart';
export 'h_o_m_e_redirect_model.dart';

class HOMERedirectWidget extends StatefulWidget {
  const HOMERedirectWidget({super.key});

  @override
  State<HOMERedirectWidget> createState() => _HOMERedirectWidgetState();
}

class _HOMERedirectWidgetState extends State<HOMERedirectWidget>
    with TickerProviderStateMixin {
  late HOMERedirectModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HOMERedirectModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().chatHistory = jsonDecode('null');
      FFAppState().chatMessage = 0;
      setState(() {});
      FFAppState().clearUserDocQueryCache();
      if (FFAppState().isDarkTheme) {
        setDarkModeSetting(context, ThemeMode.dark);
      } else {
        setDarkModeSetting(context, ThemeMode.light);
      }

      await Future.delayed(const Duration(milliseconds: 1200));
      if (valueOrDefault<bool>(currentUserDocument?.isAccountDeleted, false)) {
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
              child: GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: InfoMessageWidget(
                  text: 'Ваш аккаунт был деактивирован. Обратитесь в поддержку',
                  isError: true,
                ),
              ),
            );
          },
        ).then((value) => setState(() {}));

        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        context.goNamedAuth('Log_In', context.mounted);

        return;
      }
      if (valueOrDefault(currentUserDocument?.role, '') == 'hr') {
        context.goNamedAuth('News_all', context.mounted);
      } else {
        context.goNamedAuth('VacancyList_applicant', context.mounted);
      }
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      Theme.of(context).brightness == Brightness.dark
                          ? 'assets/images/logo_white.png'
                          : 'assets/images/logo.png.png',
                      fit: BoxFit.contain,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation']!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
