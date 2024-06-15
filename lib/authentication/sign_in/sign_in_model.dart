import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'sign_in_widget.dart' show SignInWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInModel extends FlutterFlowModel<SignInWidget> {
  ///  Local state fields for this page.

  bool isHR = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  // State field(s) for PassField widget.
  FocusNode? passFieldFocusNode;
  TextEditingController? passFieldTextController;
  late bool passFieldVisibility;
  String? Function(BuildContext, String?)? passFieldTextControllerValidator;
  // State field(s) for CorpNameField widget.
  FocusNode? corpNameFieldFocusNode;
  TextEditingController? corpNameFieldTextController;
  String? Function(BuildContext, String?)? corpNameFieldTextControllerValidator;
  // State field(s) for CompanyNameField widget.
  FocusNode? companyNameFieldFocusNode;
  TextEditingController? companyNameFieldTextController;
  String? Function(BuildContext, String?)?
      companyNameFieldTextControllerValidator;
  // State field(s) for CorpEmailField widget.
  FocusNode? corpEmailFieldFocusNode;
  TextEditingController? corpEmailFieldTextController;
  String? Function(BuildContext, String?)?
      corpEmailFieldTextControllerValidator;
  // State field(s) for CorpPassField widget.
  FocusNode? corpPassFieldFocusNode;
  TextEditingController? corpPassFieldTextController;
  late bool corpPassFieldVisibility;
  String? Function(BuildContext, String?)? corpPassFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passFieldVisibility = false;
    corpPassFieldVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    passFieldFocusNode?.dispose();
    passFieldTextController?.dispose();

    corpNameFieldFocusNode?.dispose();
    corpNameFieldTextController?.dispose();

    companyNameFieldFocusNode?.dispose();
    companyNameFieldTextController?.dispose();

    corpEmailFieldFocusNode?.dispose();
    corpEmailFieldTextController?.dispose();

    corpPassFieldFocusNode?.dispose();
    corpPassFieldTextController?.dispose();
  }
}