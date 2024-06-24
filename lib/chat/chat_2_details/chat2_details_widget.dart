import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/chat/chat_menu/chat_menu_widget.dart';
import '/chat/chat_thread_component/chat_thread_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/header_desktop/header_desktop_widget.dart';
import '/main/header_mobile_open/header_mobile_open_widget.dart';
import '/main/info_message/info_message_widget.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat2_details_model.dart';
export 'chat2_details_model.dart';

class Chat2DetailsWidget extends StatefulWidget {
  const Chat2DetailsWidget({
    super.key,
    required this.chatRef,
    required this.recipient,
  });

  final ChatsRecord? chatRef;
  final DocumentReference? recipient;

  @override
  State<Chat2DetailsWidget> createState() => _Chat2DetailsWidgetState();
}

class _Chat2DetailsWidgetState extends State<Chat2DetailsWidget> {
  late Chat2DetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Chat2DetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await widget.chatRef!.reference.update({
            ...mapToFirestore(
              {
                'last_message_seen_by':
                    FieldValue.arrayUnion([currentUserReference]),
              },
            ),
          });
        }(),
      );
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
          height: double.infinity,
          constraints: BoxConstraints(
            maxWidth: 1440.0,
          ),
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.headerDesktopModel,
                updateCallback: () => setState(() {}),
                child: HeaderDesktopWidget(
                  page: '7',
                ),
              ),
              wrapWithModel(
                model: _model.headerMobileOpenModel,
                updateCallback: () => setState(() {}),
                child: HeaderMobileOpenWidget(
                  currentPage: 7,
                ),
              ),
              Expanded(
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
                          12.0,
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
                          0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.goNamed(
                            'chat_2_main',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.leftToRight,
                                duration: Duration(milliseconds: 230),
                              ),
                            },
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.chevron_left,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            Text(
                              'Назад',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ],
                        ),
                      ),
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
                          12.0,
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
                          0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FutureBuilder<UsersRecord>(
                              future: UsersRecord.getDocumentOnce(widget
                                  .chatRef!.users
                                  .where((e) => e != currentUserReference)
                                  .toList()
                                  .first),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 15.0,
                                      height: 15.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final containerUsersRecord = snapshot.data!;
                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (valueOrDefault(
                                                  currentUserDocument?.role,
                                                  '') ==
                                              'hr') {
                                            context.pushNamed(
                                              'userFullInfo',
                                              queryParameters: {
                                                'candidat': serializeParam(
                                                  containerUsersRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'candidat':
                                                    containerUsersRecord,
                                              },
                                            );
                                          }
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2.0, 2.0, 8.0, 2.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(56.0),
                                                child: Image.network(
                                                  getCORSProxyUrl(
                                                    valueOrDefault<String>(
                                                      containerUsersRecord
                                                          .photoUrl,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/reksoft-21-46uzyi/assets/tvzhht4sf47d/photo_placeholder_new.webp',
                                                    ),
                                                  ),
                                                  width: 48.0,
                                                  height: 48.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      containerUsersRecord
                                                          .displayName,
                                                      'Ghost User',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily),
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: AutoSizeText(
                                                      valueOrDefault<String>(
                                                        containerUsersRecord
                                                            .email,
                                                        'casper@ghost.io',
                                                      ).maybeHandleOverflow(
                                                        maxChars: 40,
                                                        replacement: '…',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily),
                                                              ),
                                                      minFontSize: 10.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (valueOrDefault(
                                                    currentUserDocument?.role,
                                                    '') ==
                                                'hr')
                                              Builder(
                                                builder: (context) =>
                                                    AuthUserStreamWidget(
                                                  builder: (context) => InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.zoom2 =
                                                          await CreateZoomLinkCall
                                                              .call();

                                                      if ((_model.zoom2
                                                              ?.succeeded ??
                                                          true)) {
                                                        await launchURL(
                                                            CreateZoomLinkCall
                                                                .startUrl(
                                                          (_model.zoom2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!);
                                                        unawaited(
                                                          () async {
                                                            await ChatMessagesRecord
                                                                .collection
                                                                .doc()
                                                                .set(
                                                                    createChatMessagesRecordData(
                                                                  user:
                                                                      currentUserReference,
                                                                  chat: widget
                                                                      .chatRef
                                                                      ?.reference,
                                                                  text:
                                                                      '${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.surname, '')} создал(а) Zoom конференцию.${'\n'}Нажмите на изображение ниже, чтобы присоединиться',
                                                                  timestamp:
                                                                      getCurrentTimestamp,
                                                                  recepient: widget
                                                                      .recipient,
                                                                  isViewed:
                                                                      false,
                                                                  type: 'zoom',
                                                                  image:
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/reksoft-21-46uzyi/assets/3w0z4wx461ak/zoom.png',
                                                                  zoomLink:
                                                                      CreateZoomLinkCall
                                                                          .joinUrl(
                                                                    (_model.zoom2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                ));
                                                          }(),
                                                        );
                                                        // updateChatDocument

                                                        await widget
                                                            .chatRef!.reference
                                                            .update({
                                                          ...createChatsRecordData(
                                                            lastMessageTime:
                                                                getCurrentTimestamp,
                                                            lastMessageSentBy:
                                                                currentUserReference,
                                                            lastMessage:
                                                                'Приглашение в Zoom',
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'last_message_seen_by':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                currentUserReference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        showDialog(
                                                          barrierColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .modalBgnd,
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child:
                                                                    InfoMessageWidget(
                                                                  text:
                                                                      'Создана Zoom конференция',
                                                                  isError:
                                                                      false,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      } else {
                                                        showDialog(
                                                          barrierColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .modalBgnd,
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child:
                                                                    InfoMessageWidget(
                                                                  text:
                                                                      'Произошла ошибка при создании конференции',
                                                                  isError: true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      }

                                                      setState(() {});
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/zoom.png',
                                                        width: 42.0,
                                                        height: 42.0,
                                                        fit: BoxFit.contain,
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
                                );
                              },
                            ),
                          ),
                          if (valueOrDefault(currentUserDocument?.role, '') ==
                              'hr')
                            Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 16.0, 8.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: 12.0,
                                    borderWidth: 2.0,
                                    buttonSize: 40.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    icon: Icon(
                                      Icons.more_vert,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      await showDialog(
                                        barrierColor:
                                            FlutterFlowTheme.of(context)
                                                .modalBgnd,
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: ChatMenuWidget(
                                                chatRef:
                                                    widget.chatRef!.reference,
                                                recepient: widget.recipient!,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            valueOrDefault<double>(
                              () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
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
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
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
                        child: wrapWithModel(
                          model: _model.chatThreadComponentModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: ChatThreadComponentWidget(
                            chatRef: widget.chatRef,
                            recepient: widget.recipient!,
                          ),
                        ),
                      ),
                    ),
                  ].addToEnd(SizedBox(height: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 54.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 43.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 43.0;
                    } else {
                      return 60.0;
                    }
                  }())),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
