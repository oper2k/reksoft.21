import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/info_message/info_message_widget.dart';
import '/vacancy/vacancy_components/response_decline/response_decline_widget.dart';
import 'dart:async';
import 'dart:math';
import 'response_accept_widget.dart' show ResponseAcceptWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResponseAcceptModel extends FlutterFlowModel<ResponseAcceptWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Send email)] action in Button widget.
  ApiCallResponse? apiResultnma;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
