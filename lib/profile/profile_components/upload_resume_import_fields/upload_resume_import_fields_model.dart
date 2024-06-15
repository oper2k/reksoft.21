import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/info_message/info_message_widget.dart';
import 'dart:async';
import 'dart:math';
import 'upload_resume_import_fields_widget.dart'
    show UploadResumeImportFieldsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadResumeImportFieldsModel
    extends FlutterFlowModel<UploadResumeImportFieldsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Parse Resume PDF Fields by GPT)] action in Button widget.
  ApiCallResponse? gptResponseParseFile;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
