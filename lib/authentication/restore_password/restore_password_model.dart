import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'restore_password_widget.dart' show RestorePasswordWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RestorePasswordModel extends FlutterFlowModel<RestorePasswordWidget> {
  ///  Local state fields for this page.

  bool isHR = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  // State field(s) for PassField widget.
  FocusNode? passFieldFocusNode;
  TextEditingController? passFieldTextController;
  late bool passFieldVisibility;
  String? Function(BuildContext, String?)? passFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passFieldVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    passFieldFocusNode?.dispose();
    passFieldTextController?.dispose();
  }
}
