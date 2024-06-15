import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'social_links_field_widget.dart' show SocialLinksFieldWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SocialLinksFieldModel extends FlutterFlowModel<SocialLinksFieldWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for LinkField widget.
  FocusNode? linkFieldFocusNode;
  TextEditingController? linkFieldTextController;
  String? Function(BuildContext, String?)? linkFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    linkFieldFocusNode?.dispose();
    linkFieldTextController?.dispose();
  }
}
