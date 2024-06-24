import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/chat/delete_chat_confirm/delete_chat_confirm_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/info_message/info_message_widget.dart';
import 'dart:async';
import 'chat_menu_widget.dart' show ChatMenuWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatMenuModel extends FlutterFlowModel<ChatMenuWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (createZoomLink)] action in Button widget.
  ApiCallResponse? zoom;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
