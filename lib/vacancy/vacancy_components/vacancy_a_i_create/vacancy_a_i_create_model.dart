import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/info_message/info_message_widget.dart';
import 'dart:async';
import 'dart:math';
import 'vacancy_a_i_create_widget.dart' show VacancyAICreateWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VacancyAICreateModel extends FlutterFlowModel<VacancyAICreateWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for job widget.
  FocusNode? jobFocusNode;
  TextEditingController? jobTextController;
  String? Function(BuildContext, String?)? jobTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  VacanciesRecord? newVacancy;
  // Stores action output result for [Backend Call - API (generateVacancy)] action in Button widget.
  ApiCallResponse? apiGeneratingResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    jobFocusNode?.dispose();
    jobTextController?.dispose();
  }
}
