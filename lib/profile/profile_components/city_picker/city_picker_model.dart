import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'city_picker_widget.dart' show CityPickerWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CityPickerModel extends FlutterFlowModel<CityPickerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CityField widget.
  FocusNode? cityFieldFocusNode;
  TextEditingController? cityFieldTextController;
  String? Function(BuildContext, String?)? cityFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cityFieldFocusNode?.dispose();
    cityFieldTextController?.dispose();
  }
}
