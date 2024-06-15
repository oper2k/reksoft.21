import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'filter_mobile_widget.dart' show FilterMobileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterMobileModel extends FlutterFlowModel<FilterMobileWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for specializations widget.
  String? specializationsValue;
  FormFieldController<String>? specializationsValueController;
  // State field(s) for employmentType widget.
  String? employmentTypeValue;
  FormFieldController<String>? employmentTypeValueController;
  // State field(s) for workFormat widget.
  String? workFormatValue;
  FormFieldController<String>? workFormatValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
