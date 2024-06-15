import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/footer/footer_widget.dart';
import '/main/header_desktop/header_desktop_widget.dart';
import '/main/header_mobile/header_mobile_widget.dart';
import '/main/info_message/info_message_widget.dart';
import 'dart:async';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_page_model.dart';
export 'chat_page_model.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    super.key,
    required this.vacancy,
    required this.response,
  });

  final VacanciesRecord? vacancy;
  final ResponseRecord? response;

  @override
  State<ChatPageWidget> createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget>
    with TickerProviderStateMixin {
  late ChatPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().chatMessage == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Ждем рекрутера',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: Duration(milliseconds: 2000),
            backgroundColor: FlutterFlowTheme.of(context).primary,
          ),
        );
        FFAppState().chatHistory = functions.saveChatHistory(
            FFAppState().chatHistory, functions.convertToJSONSystem('ytn'));
        setState(() {});
        _model.chatGPTResponse23Copy =
            await OpenAIChatGPTGroup.sendFullPromptCall.call(
          promptJson: FFAppState().chatHistory,
        );
        if ((_model.chatGPTResponse23Copy?.succeeded ?? true)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Рекрутер присоединился к чату',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).primary,
            ),
          );
          _model.showPanel = true;
          setState(() {});
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                (_model.chatGPTResponse23Copy?.exceptionMessage ?? ''),
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).primary,
            ),
          );
        }
      } else {
        _model.showPanel = true;
        setState(() {});
      }
    });

    _model.messageFieldTextController ??= TextEditingController();
    _model.messageFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'rowOnPageLoadAnimation1': AnimationInfo(
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
      'rowOnPageLoadAnimation2': AnimationInfo(
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: 1440.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              wrapWithModel(
                model: _model.headerDesktopModel,
                updateCallback: () => setState(() {}),
                child: HeaderDesktopWidget(
                  page: 'chat',
                ),
              ),
              wrapWithModel(
                model: _model.headerMobileModel,
                updateCallback: () => setState(() {}),
                child: HeaderMobileWidget(
                  currentPage: 2,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _model.columnController1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            valueOrDefault<double>(
                              () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return 16.0;
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
                            valueOrDefault<double>(
                              () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return 164.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return 24.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return 24.0;
                                } else {
                                  return 40.0;
                                }
                              }(),
                              0.0,
                            ),
                            valueOrDefault<double>(
                              () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return 16.0;
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
                            valueOrDefault<double>(
                              () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return 173.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return 73.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return 73.0;
                                } else {
                                  return 40.0;
                                }
                              }(),
                              0.0,
                            )),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                              ))
                                Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Ответьте на вопросы и рекрутер свяжется с вами',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMediumFamily),
                                        ),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0,
                                    valueOrDefault<double>(
                                      () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 16.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 32.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 32.0;
                                        } else {
                                          return 32.0;
                                        }
                                      }(),
                                      0.0,
                                    ),
                                    0.0,
                                    0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().chatHistory =
                                        jsonDecode('null');
                                    FFAppState().chatMessage = 0;
                                    setState(() {});
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/icon-action.png',
                                        width: 20.0,
                                        height: 20.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          widget.vacancy?.jobTitle,
                                          'Вакансия',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color: Color(0xFF888888),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
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
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 32.0),
                                child: Container(
                                  width: double.infinity,
                                  height: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 692.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 648.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 648.0;
                                    } else {
                                      return 312.0;
                                    }
                                  }(),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Visibility(
                                    visible: FFAppState().chatHistory != null,
                                    child: Builder(
                                      builder: (context) {
                                        final chat =
                                            FFAppState().chatHistory.toList();
                                        return SingleChildScrollView(
                                          primary: false,
                                          controller: _model.columnController2,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(chat.length,
                                                (chatIndex) {
                                              final chatItem = chat[chatIndex];
                                              return Visibility(
                                                visible: chatIndex != 0,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if ((int index) {
                                                        return index % 2 != 0;
                                                      }(chatIndex))
                                                        Padding(
                                                          padding: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  24.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 0.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 24.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 24.0;
                                                                      } else {
                                                                        return 500.0;
                                                                      }
                                                                    }(),
                                                                    0.0,
                                                                  ),
                                                                  24.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        Container(
                                                                  width: 30.0,
                                                                  height: 30.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    getCORSProxyUrl(
                                                                      currentUserPhoto,
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        getJsonField(
                                                                          chatItem,
                                                                          r'''$['content']''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              lineHeight: 1.4,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'rowOnPageLoadAnimation1']!),
                                                        ),
                                                      if (chatIndex % 2 == 0)
                                                        Padding(
                                                          padding: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
                                                                    () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 0.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 24.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 24.0;
                                                                      } else {
                                                                        return 500.0;
                                                                      }
                                                                    }(),
                                                                    0.0,
                                                                  ),
                                                                  24.0,
                                                                  0.0,
                                                                  24.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Text(
                                                                        getJsonField(
                                                                          chatItem,
                                                                          r'''$['content']''',
                                                                        ).toString(),
                                                                        textAlign:
                                                                            TextAlign.end,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              lineHeight: 1.4,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 30.0,
                                                                height: 30.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/logoRound.png',
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                            ],
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'rowOnPageLoadAnimation2']!),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: TextFormField(
                                  controller: _model.messageFieldTextController,
                                  focusNode: _model.messageFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.messageFieldTextController',
                                    Duration(milliseconds: 100),
                                    () => setState(() {}),
                                  ),
                                  onFieldSubmitted: (_) async {
                                    FFAppState().chatHistory =
                                        functions.saveChatHistory(
                                            FFAppState().chatHistory,
                                            functions.convertToJSON(_model
                                                .messageFieldTextController
                                                .text));
                                    FFAppState().chatMessage =
                                        FFAppState().chatMessage + 1;
                                    setState(() {});
                                    await Future.delayed(
                                        const Duration(milliseconds: 100));
                                    await _model.columnController2?.animateTo(
                                      _model.columnController2!.position
                                          .maxScrollExtent,
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.ease,
                                    );
                                    _model.chatGPTResponse23 =
                                        await OpenAIChatGPTGroup
                                            .sendFullPromptCall
                                            .call(
                                      promptJson: FFAppState().chatHistory,
                                    );
                                    if ((_model.chatGPTResponse23?.succeeded ??
                                        true)) {
                                      FFAppState().chatHistory = getJsonField(
                                        functions.saveChatHistory(
                                            FFAppState().chatHistory,
                                            getJsonField(
                                              (_model.chatGPTResponse23
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$['choices'][0]['message']''',
                                            )),
                                        r'''$''',
                                      );
                                      setState(() {});
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Что-то пошло не так...',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                      );
                                    }

                                    await Future.delayed(
                                        const Duration(milliseconds: 100));
                                    await _model.columnController2?.animateTo(
                                      _model.columnController2!.position
                                          .maxScrollExtent,
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.ease,
                                    );
                                    setState(() {
                                      _model.messageFieldTextController?.text =
                                          '';
                                      _model.messageFieldTextController
                                              ?.selection =
                                          TextSelection.collapsed(
                                              offset: _model
                                                  .messageFieldTextController!
                                                  .text
                                                  .length);
                                    });

                                    setState(() {});
                                  },
                                  autofocus: false,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Ваше сообщение',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFD8DBE7),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
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
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .messageFieldTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              if (valueOrDefault(
                                      currentUserDocument?.role, '') ==
                                  'applicant')
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 50.0, 16.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          unawaited(
                                            () async {
                                              _model.analysechatresp =
                                                  await AnalyseChatCall.call(
                                                jsonDataJson:
                                                    FFAppState().chatHistory,
                                                responseId: widget
                                                    .response?.reference.id,
                                              );
                                            }(),
                                          );

                                          await widget.response!.reference
                                              .update(createResponseRecordData(
                                            isChatFinished: true,
                                            status: 'Прошел вводное интервью',
                                          ));

                                          await NotificationsRecord.collection
                                              .doc()
                                              .set(
                                                  createNotificationsRecordData(
                                                from: currentUserReference,
                                                to: widget.vacancy?.creator,
                                                type: 'Прошел вводное интервью',
                                                text:
                                                    'Здравствуйте. Я прошёл вводное интервью с рекрутером. Вот что мы обсудили: ${valueOrDefault<String>(
                                                  widget.response?.chatSummary,
                                                  'Данных пока нет...',
                                                )}',
                                                createdTime:
                                                    getCurrentTimestamp,
                                                isViewed: false,
                                                response:
                                                    widget.response?.reference,
                                                vacancy:
                                                    widget.vacancy?.reference,
                                              ));
                                          FFAppState().chatHistory =
                                              jsonDecode('null');
                                          FFAppState().chatMessage = 0;
                                          setState(() {});
                                          context.safePop();
                                          showDialog(
                                            barrierColor:
                                                FlutterFlowTheme.of(context)
                                                    .customColor1,
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
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: InfoMessageWidget(
                                                    text:
                                                        'Спасибо за интервью! Информация отправлена рекрутеру',
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));

                                          setState(() {});
                                        },
                                        text: 'Закончить интервью',
                                        options: FFButtonOptions(
                                          width: 300.0,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (valueOrDefault(
                                      currentUserDocument?.role, '') ==
                                  'applicant')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 36.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                'Нажмите на эту кнопку только ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          TextSpan(
                                            text: 'после окончания интервью',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                ' и ваши результаты увидит рекрутер',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                            ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
      ),
    );
  }
}
