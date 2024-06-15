import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/footer/footer_widget.dart';
import '/main/header_desktop/header_desktop_widget.dart';
import '/main/header_mobile/header_mobile_widget.dart';
import '/placeholders/empty_notifications_list/empty_notifications_list_widget.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: 1440.0,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    wrapWithModel(
                      model: _model.headerDesktopModel,
                      updateCallback: () => setState(() {}),
                      child: HeaderDesktopWidget(
                        page: 'notify',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.headerMobileModel,
                      updateCallback: () => setState(() {}),
                      child: HeaderMobileWidget(
                        currentPage: 0,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            120.0,
                            valueOrDefault<double>(
                              () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return 18.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return 24.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return 24.0;
                                } else {
                                  return 32.0;
                                }
                              }(),
                              0.0,
                            ),
                            120.0,
                            0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  spacing: 24.0,
                                  runSpacing: 24.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.up,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Text(
                                      'Все уведомления',
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
                                    if (false)
                                      Text(
                                        'Отметить все прочитанным',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
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
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        24.0,
                                        0.0,
                                        valueOrDefault<double>(
                                          () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 100.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 34.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 34.0;
                                            } else {
                                              return 98.0;
                                            }
                                          }(),
                                          0.0,
                                        )),
                                    child: StreamBuilder<
                                        List<NotificationsRecord>>(
                                      stream: queryNotificationsRecord(
                                        queryBuilder: (notificationsRecord) =>
                                            notificationsRecord
                                                .where(
                                                  'to',
                                                  isEqualTo:
                                                      currentUserReference,
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
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<NotificationsRecord>
                                            getNotificationsNotificationsRecordList =
                                            snapshot.data!;
                                        return Container(
                                          width: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 420.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 390.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 390.0;
                                            } else {
                                              return 464.0;
                                            }
                                          }(),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(24.0),
                                            child: Builder(
                                              builder: (context) {
                                                final notify =
                                                    getNotificationsNotificationsRecordList
                                                        .toList();
                                                if (notify.isEmpty) {
                                                  return EmptyNotificationsListWidget();
                                                }
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                            notify.length,
                                                            (notifyIndex) {
                                                      final notifyItem =
                                                          notify[notifyIndex];
                                                      return FutureBuilder<
                                                          UsersRecord>(
                                                        future: UsersRecord
                                                            .getDocumentOnce(
                                                                notifyItem
                                                                    .from!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          final itemUsersRecord =
                                                              snapshot.data!;
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.currentNotification =
                                                                  notifyItem;
                                                              _model.sender =
                                                                  itemUsersRecord;
                                                              setState(() {});
                                                              if (!notifyItem
                                                                  .isViewed) {
                                                                unawaited(
                                                                  () async {
                                                                    await notifyItem
                                                                        .reference
                                                                        .update(
                                                                            createNotificationsRecordData(
                                                                      isViewed:
                                                                          true,
                                                                    ));
                                                                  }(),
                                                                );
                                                              }
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: _model
                                                                            .currentNotification
                                                                            ?.reference ==
                                                                        notifyItem
                                                                            .reference
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .lightGray1
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18.0),
                                                              ),
                                                              child: Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            24.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: 56.0,
                                                                              height: 56.0,
                                                                              clipBehavior: Clip.antiAlias,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: CachedNetworkImage(
                                                                                fadeInDuration: Duration(milliseconds: 100),
                                                                                fadeOutDuration: Duration(milliseconds: 100),
                                                                                imageUrl: getCORSProxyUrl(
                                                                                  valueOrDefault<String>(
                                                                                    itemUsersRecord.photoUrl,
                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/reksoft-21-46uzyi/assets/tvzhht4sf47d/photo_placeholder_new.webp',
                                                                                  ),
                                                                                ),
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      () {
                                                                                        if (notifyItem.type == 'Приглашение') {
                                                                                          return 'Приглашение';
                                                                                        } else if (notifyItem.type == 'Приглашение на вводное интервью') {
                                                                                          return 'Приглашение на вводное интервью';
                                                                                        } else if (notifyItem.type == 'Отказ') {
                                                                                          return 'Отказ';
                                                                                        } else if (notifyItem.type == 'Отклик') {
                                                                                          return 'Отклик на вакансию';
                                                                                        } else {
                                                                                          return 'Уведомление';
                                                                                        }
                                                                                      }(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: () {
                                                                                              if (notifyItem.type == 'Приглашение') {
                                                                                                return FlutterFlowTheme.of(context).success;
                                                                                              } else if (notifyItem.type == 'Приглашение на вводное интервью') {
                                                                                                return FlutterFlowTheme.of(context).primary;
                                                                                              } else if (notifyItem.type == 'Отказ') {
                                                                                                return FlutterFlowTheme.of(context).error;
                                                                                              } else if (notifyItem.type == 'Отклик') {
                                                                                                return FlutterFlowTheme.of(context).primary;
                                                                                              } else {
                                                                                                return FlutterFlowTheme.of(context).primaryText;
                                                                                              }
                                                                                            }(),
                                                                                            fontSize: 15.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        '${'${itemUsersRecord.displayName} ${itemUsersRecord.surname}'} - ${itemUsersRecord.role == 'hr' ? itemUsersRecord.hrCompanyName : 'кандидат'}',
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                      child: RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: notifyItem.text,
                                                                                              style: TextStyle(),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                lineHeight: 1.4,
                                                                                              ),
                                                                                        ),
                                                                                        maxLines: 3,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              12.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            dateTimeFormat(
                                                                              'd MMMM в HH:mm',
                                                                              notifyItem.createdTime!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).gray,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  if (!notifyItem
                                                                      .isViewed)
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            12.0,
                                                                        height:
                                                                            12.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    })
                                                        .divide(SizedBox(
                                                            height: 24.0))
                                                        .addToEnd(SizedBox(
                                                            height: 60.0)),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (_model.currentNotification != null)
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      valueOrDefault<double>(
                                        () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 0.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 20.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 20.0;
                                          } else {
                                            return 52.0;
                                          }
                                        }(),
                                        0.0,
                                      ),
                                      60.0,
                                      0.0,
                                      0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 40.0,
                                            height: 40.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 100),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 100),
                                              imageUrl: getCORSProxyUrl(
                                                valueOrDefault<String>(
                                                  _model.sender?.photoUrl,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/reksoft-21-46uzyi/assets/tvzhht4sf47d/photo_placeholder_new.webp',
                                                ),
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '${'${_model.sender?.displayName} ${_model.sender?.surname}'} - ${_model.sender?.role == 'hr' ? _model.sender?.hrCompanyName : 'кандидат'}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                          Text(
                                            dateTimeFormat(
                                              'd MMMM в HH:mm',
                                              _model.currentNotification!
                                                  .createdTime!,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .gray,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
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
                                            0.0, 32.0, 0.0, 0.0),
                                        child: Text(
                                          () {
                                            if (_model.currentNotification
                                                    ?.type ==
                                                'Приглашение') {
                                              return 'Приглашение на интервью';
                                            } else if (_model
                                                    .currentNotification
                                                    ?.type ==
                                                'Приглашение на вводное интервью') {
                                              return 'Приглашение на вводное интервью';
                                            } else if (_model
                                                    .currentNotification
                                                    ?.type ==
                                                'Отказ') {
                                              return 'К сожалению вам отказали';
                                            } else if (_model
                                                    .currentNotification
                                                    ?.type ==
                                                'Отклик') {
                                              return 'Отклик на вакансию';
                                            } else {
                                              return 'Уведомление от компании';
                                            }
                                          }(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: () {
                                                  if (_model.currentNotification
                                                          ?.type ==
                                                      'Приглашение') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .success;
                                                  } else if (_model
                                                          .currentNotification
                                                          ?.type ==
                                                      'Приглашение на вводное интервью') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primary;
                                                  } else if (_model
                                                          .currentNotification
                                                          ?.type ==
                                                      'Отказ') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .error;
                                                  } else if (_model
                                                          .currentNotification
                                                          ?.type ==
                                                      'Отклик') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primary;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText;
                                                  }
                                                }(),
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
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 32.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            _model.currentNotification?.text,
                                            'Text',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                                lineHeight: 1.4,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 32.0, 0.0, 0.0),
                                        child: StreamBuilder<ResponseRecord>(
                                          stream: ResponseRecord.getDocument(
                                              _model.currentNotification!
                                                  .response!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 20.0,
                                                  height: 20.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      Colors.transparent,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final chatBtnResponseRecord =
                                                snapshot.data!;
                                            return Container(
                                              decoration: BoxDecoration(),
                                              child: Visibility(
                                                visible: (chatBtnResponseRecord
                                                            .status ==
                                                        'Приглашение на вводное интервью') &&
                                                    !chatBtnResponseRecord
                                                        .isChatFinished &&
                                                    (valueOrDefault(
                                                            currentUserDocument
                                                                ?.role,
                                                            '') !=
                                                        'hr'),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.vacancy =
                                                          await VacanciesRecord
                                                              .getDocumentOnce(_model
                                                                  .currentNotification!
                                                                  .vacancy!);

                                                      context.pushNamed(
                                                        'Chat_Page',
                                                        queryParameters: {
                                                          'vacancy':
                                                              serializeParam(
                                                            _model.vacancy,
                                                            ParamType.Document,
                                                          ),
                                                          'response':
                                                              serializeParam(
                                                            chatBtnResponseRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'vacancy':
                                                              _model.vacancy,
                                                          'response':
                                                              chatBtnResponseRecord,
                                                        },
                                                      );

                                                      setState(() {});
                                                    },
                                                    text:
                                                        'Пройти вводное интервью',
                                                    options: FFButtonOptions(
                                                      width: 280.0,
                                                      height: 50.0,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      if (valueOrDefault(
                                              currentUserDocument?.role, '') ==
                                          'hr')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) =>
                                                FFButtonWidget(
                                              onPressed: () async {
                                                context
                                                    .pushNamed('HR_Candidates');
                                              },
                                              text: 'Перейти к  кандидатам',
                                              options: FFButtonOptions(
                                                width: 280.0,
                                                height: 50.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                    BorderRadius.circular(6.0),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
