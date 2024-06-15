import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/main/info_message/info_message_widget.dart';
import '/profile/profile_components/upload_resume_import_fields/upload_resume_import_fields_widget.dart';
import 'dart:async';
import 'dart:math';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'upload_resume_widget.dart' show UploadResumeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class UploadResumeModel extends FlutterFlowModel<UploadResumeWidget> {
  ///  Local state fields for this component.

  String? fileName;

  bool isLoadingFileStart = false;

  bool isFileLoadingComplete = false;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (Send file to GPT)] action in Button widget.
  ApiCallResponse? gptResponseAnalysFile;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
