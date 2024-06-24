import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/info_message/info_message_widget.dart';
import '/profile/profile_components/upload_resume/upload_resume_widget.dart';
import 'dart:math';
import 'comment_downld_widget.dart' show CommentDownldWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommentDownldModel extends FlutterFlowModel<CommentDownldWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for social widget.
  FocusNode? socialFocusNode;
  TextEditingController? socialTextController;
  String? Function(BuildContext, String?)? socialTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    socialFocusNode?.dispose();
    socialTextController?.dispose();
  }
}
