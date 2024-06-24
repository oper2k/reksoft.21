import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat/empty_state_simple/empty_state_simple_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/header_desktop/header_desktop_widget.dart';
import '/main/header_mobile_open/header_mobile_open_widget.dart';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat2_main_model.dart';
export 'chat2_main_model.dart';

class Chat2MainWidget extends StatefulWidget {
  const Chat2MainWidget({super.key});

  @override
  State<Chat2MainWidget> createState() => _Chat2MainWidgetState();
}

class _Chat2MainWidgetState extends State<Chat2MainWidget>
    with TickerProviderStateMixin {
  late Chat2MainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Chat2MainModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: null,
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
          constraints: BoxConstraints(
            maxWidth: 1440.0,
          ),
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              Flexible(
                child: Padding(
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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onLongPress: () async {
                            context.safePop();
                          },
                          child: Text(
                            'Мои чаты',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineLargeFamily,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineLargeFamily),
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) =>
                                StreamBuilder<List<ChatsRecord>>(
                              stream: queryChatsRecord(
                                queryBuilder: (chatsRecord) => chatsRecord
                                    .where(
                                      'users',
                                      arrayContains: currentUserReference,
                                    )
                                    .orderBy('last_message_time',
                                        descending: true),
                              ),
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
                                List<ChatsRecord> listViewChatsRecordList =
                                    snapshot.data!;
                                if (listViewChatsRecordList.isEmpty) {
                                  return Center(
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: EmptyStateSimpleWidget(
                                        icon: Icon(
                                          Icons.mark_chat_unread_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 90.0,
                                        ),
                                        title: 'Нет чатов',
                                        body: valueOrDefault(
                                                    currentUserDocument?.role,
                                                    '') ==
                                                'hr'
                                            ? 'У вас пока нет ни одного созданного чата, вы можете начать чат на странице кандидатов'
                                            : 'У вас пока нет ни одного созданного чата, дождитесь пока вам напишет HR',
                                      ),
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewChatsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewChatsRecord =
                                        listViewChatsRecordList[listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 1.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'chat_2_Details',
                                            queryParameters: {
                                              'chatRef': serializeParam(
                                                listViewChatsRecord,
                                                ParamType.Document,
                                              ),
                                              'recipient': serializeParam(
                                                listViewChatsRecord.users
                                                    .where((e) =>
                                                        e !=
                                                        currentUserReference)
                                                    .toList()
                                                    .first,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'chatRef': listViewChatsRecord,
                                            },
                                          );
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 0.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  offset: Offset(
                                                    0.0,
                                                    1.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          12.0, 12.0),
                                                  child: FutureBuilder<
                                                      UsersRecord>(
                                                    future: FFAppState()
                                                        .userDocQuery(
                                                      uniqueQueryKey:
                                                          listViewChatsRecord
                                                              .reference.id,
                                                      requestFn: () => UsersRecord
                                                          .getDocumentOnce(
                                                              listViewChatsRecord
                                                                  .users
                                                                  .where((e) =>
                                                                      e.id !=
                                                                      currentUserReference
                                                                          ?.id)
                                                                  .toList()
                                                                  .first),
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
                                                      final rowUsersRecord =
                                                          snapshot.data!;
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          56.0),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            100),
                                                                fadeOutDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            100),
                                                                imageUrl:
                                                                    getCORSProxyUrl(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    rowUsersRecord
                                                                        .photoUrl,
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/reksoft-21-46uzyi/assets/tvzhht4sf47d/photo_placeholder_new.webp',
                                                                  ),
                                                                ),
                                                                width: 56.0,
                                                                height: 56.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
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
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Чат с ${valueOrDefault<String>(
                                                                              rowUsersRecord.displayName,
                                                                              '-_-',
                                                                            )} ${rowUsersRecord.surname}',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (!listViewChatsRecord
                                                                          .lastMessageSeenBy
                                                                          .contains(
                                                                              currentUserReference))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                10.0,
                                                                            height:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              shape: BoxShape.circle,
                                                                              border: Border.all(
                                                                                color: Colors.transparent,
                                                                                width: 0.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${listViewChatsRecord.lastMessageSentBy == currentUserReference ? 'Вы: ' : ''}${listViewChatsRecord.lastMessage}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelMediumFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          dateTimeFormat(
                                                                            'relative',
                                                                            listViewChatsRecord.lastMessageTime!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .chevron_right_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            16.0)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(
                                        animationsMap[
                                            'containerOnPageLoadAnimation']!,
                                        effects: [
                                          MoveEffect(
                                            curve: Curves.easeInOut,
                                            delay: (300 * listViewIndex)
                                                .toDouble()
                                                .ms,
                                            duration: 600.0.ms,
                                            begin: Offset(0.0, 100.0),
                                            end: Offset(0.0, 0.0),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
