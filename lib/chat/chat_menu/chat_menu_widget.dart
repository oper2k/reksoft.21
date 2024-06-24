import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/chat/delete_chat_confirm/delete_chat_confirm_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/info_message/info_message_widget.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_menu_model.dart';
export 'chat_menu_model.dart';

class ChatMenuWidget extends StatefulWidget {
  const ChatMenuWidget({
    super.key,
    required this.chatRef,
    required this.recepient,
  });

  final DocumentReference? chatRef;
  final DocumentReference? recepient;

  @override
  State<ChatMenuWidget> createState() => _ChatMenuWidgetState();
}

class _ChatMenuWidgetState extends State<ChatMenuWidget> {
  late ChatMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatMenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: 592.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 24.0, 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(
                builder: (context) => FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                    _model.zoom = await CreateZoomLinkCall.call();

                    if ((_model.zoom?.succeeded ?? true)) {
                      await launchURL(CreateZoomLinkCall.startUrl(
                        (_model.zoom?.jsonBody ?? ''),
                      )!);
                      unawaited(
                        () async {
                          await ChatMessagesRecord.collection
                              .doc()
                              .set(createChatMessagesRecordData(
                                user: currentUserReference,
                                chat: widget.chatRef,
                                text:
                                    '${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.surname, '')} создал(а) Zoom конференцию.${'\n'}Нажмите на изображение ниже, чтобы присоединиться',
                                timestamp: getCurrentTimestamp,
                                recepient: widget.recepient,
                                isViewed: false,
                                type: 'zoom',
                                image:
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/reksoft-21-46uzyi/assets/3w0z4wx461ak/zoom.png',
                                zoomLink: CreateZoomLinkCall.joinUrl(
                                  (_model.zoom?.jsonBody ?? ''),
                                ),
                              ));
                        }(),
                      );
                      // updateChatDocument
                      unawaited(
                        () async {
                          await widget.chatRef!.update({
                            ...createChatsRecordData(
                              lastMessageTime: getCurrentTimestamp,
                              lastMessageSentBy: currentUserReference,
                              lastMessage: 'Приглашение в Zoom',
                            ),
                            ...mapToFirestore(
                              {
                                'last_message_seen_by': FieldValue.arrayUnion(
                                    [currentUserReference]),
                              },
                            ),
                          });
                        }(),
                      );
                      showDialog(
                        barrierColor: FlutterFlowTheme.of(context).modalBgnd,
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: InfoMessageWidget(
                              text: 'Создана Zoom конференция',
                              isError: false,
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    } else {
                      showDialog(
                        barrierColor: FlutterFlowTheme.of(context).modalBgnd,
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: InfoMessageWidget(
                              text: 'Произошла ошибка при создании конференции',
                              isError: true,
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    }

                    setState(() {});
                  },
                  text: 'Пригласить в Zoom',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0x003378FF),
                    textStyle: FlutterFlowTheme.of(context)
                        .headlineMedium
                        .override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineMediumFamily,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context)
                                  .headlineMediumFamily),
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                    hoverColor: FlutterFlowTheme.of(context).lightGray1,
                  ),
                ),
              ),
              Builder(
                builder: (context) => FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
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
                          child: DeleteChatConfirmWidget(
                            chatRef: widget.chatRef!,
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  text: 'Удалить чат',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0x003378FF),
                    textStyle: FlutterFlowTheme.of(context)
                        .headlineMedium
                        .override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineMediumFamily,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context)
                                  .headlineMediumFamily),
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                    hoverColor: FlutterFlowTheme.of(context).lightGray1,
                  ),
                ),
              ),
            ].divide(SizedBox(height: 32.0)),
          ),
        ),
      ),
    );
  }
}
