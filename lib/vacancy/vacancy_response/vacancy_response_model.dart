import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/info_message/info_message_widget.dart';
import '/profile/profile_components/upload_resume/upload_resume_widget.dart';
import 'dart:async';
import 'dart:math';
import 'vacancy_response_widget.dart' show VacancyResponseWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VacancyResponseModel extends FlutterFlowModel<VacancyResponseWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for social widget.
  FocusNode? socialFocusNode;
  TextEditingController? socialTextController;
  String? Function(BuildContext, String?)? socialTextControllerValidator;
  // State field(s) for website widget.
  FocusNode? websiteFocusNode;
  TextEditingController? websiteTextController;
  String? Function(BuildContext, String?)? websiteTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? responsesCount;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ResponseRecord? response;
  // Stores action output result for [Backend Call - API (Send email)] action in Button widget.
  ApiCallResponse? apiResultnma;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    socialFocusNode?.dispose();
    socialTextController?.dispose();

    websiteFocusNode?.dispose();
    websiteTextController?.dispose();
  }
}
