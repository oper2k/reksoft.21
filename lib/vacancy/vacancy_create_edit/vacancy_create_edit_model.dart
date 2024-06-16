import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main/footer/footer_widget.dart';
import '/main/header_desktop/header_desktop_widget.dart';
import '/main/header_mobile_open/header_mobile_open_widget.dart';
import '/main/info_message/info_message_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'vacancy_create_edit_widget.dart' show VacancyCreateEditWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VacancyCreateEditModel extends FlutterFlowModel<VacancyCreateEditWidget> {
  ///  Local state fields for this page.

  List<String> skills = [];
  void addToSkills(String item) => skills.add(item);
  void removeFromSkills(String item) => skills.remove(item);
  void removeAtIndexFromSkills(int index) => skills.removeAt(index);
  void insertAtIndexInSkills(int index, String item) =>
      skills.insert(index, item);
  void updateSkillsAtIndex(int index, Function(String) updateFn) =>
      skills[index] = updateFn(skills[index]);

  bool isSalaryRange = false;

  String? selectedCity;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for HeaderDesktop component.
  late HeaderDesktopModel headerDesktopModel;
  // Model for HeaderMobileOpen component.
  late HeaderMobileOpenModel headerMobileOpenModel;
  // State field(s) for DolzhnostField widget.
  FocusNode? dolzhnostFieldFocusNode;
  TextEditingController? dolzhnostFieldTextController;
  String? Function(BuildContext, String?)?
      dolzhnostFieldTextControllerValidator;
  String? _dolzhnostFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  // State field(s) for SpecField widget.
  String? specFieldValue;
  FormFieldController<String>? specFieldValueController;
  // State field(s) for AboutDolzhnostField widget.
  FocusNode? aboutDolzhnostFieldFocusNode;
  TextEditingController? aboutDolzhnostFieldTextController;
  String? Function(BuildContext, String?)?
      aboutDolzhnostFieldTextControllerValidator;
  String? _aboutDolzhnostFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  // State field(s) for TrebovaniyaField widget.
  FocusNode? trebovaniyaFieldFocusNode;
  TextEditingController? trebovaniyaFieldTextController;
  String? Function(BuildContext, String?)?
      trebovaniyaFieldTextControllerValidator;
  String? _trebovaniyaFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  // State field(s) for skillInput widget.
  FocusNode? skillInputFocusNode;
  TextEditingController? skillInputTextController;
  String? Function(BuildContext, String?)? skillInputTextControllerValidator;
  // State field(s) for TypeFormat widget.
  String? typeFormatValue;
  FormFieldController<String>? typeFormatValueController;
  // State field(s) for WorkFormat widget.
  String? workFormatValue;
  FormFieldController<String>? workFormatValueController;
  // State field(s) for salaryMin widget.
  FocusNode? salaryMinFocusNode;
  TextEditingController? salaryMinTextController;
  String? Function(BuildContext, String?)? salaryMinTextControllerValidator;
  String? _salaryMinTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for salaryMax widget.
  FocusNode? salaryMaxFocusNode;
  TextEditingController? salaryMaxTextController;
  String? Function(BuildContext, String?)? salaryMaxTextControllerValidator;
  // State field(s) for conditionsField widget.
  FocusNode? conditionsFieldFocusNode;
  TextEditingController? conditionsFieldTextController;
  String? Function(BuildContext, String?)?
      conditionsFieldTextControllerValidator;
  String? _conditionsFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  // State field(s) for LinkField widget.
  FocusNode? linkFieldFocusNode;
  TextEditingController? linkFieldTextController;
  String? Function(BuildContext, String?)? linkFieldTextControllerValidator;
  // State field(s) for CityField widget.
  FocusNode? cityFieldFocusNode;
  TextEditingController? cityFieldTextController;
  String? Function(BuildContext, String?)? cityFieldTextControllerValidator;
  String? _cityFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for WorkAdressField widget.
  FocusNode? workAdressFieldFocusNode;
  TextEditingController? workAdressFieldTextController;
  String? Function(BuildContext, String?)?
      workAdressFieldTextControllerValidator;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerDesktopModel = createModel(context, () => HeaderDesktopModel());
    headerMobileOpenModel = createModel(context, () => HeaderMobileOpenModel());
    dolzhnostFieldTextControllerValidator =
        _dolzhnostFieldTextControllerValidator;
    aboutDolzhnostFieldTextControllerValidator =
        _aboutDolzhnostFieldTextControllerValidator;
    trebovaniyaFieldTextControllerValidator =
        _trebovaniyaFieldTextControllerValidator;
    salaryMinTextControllerValidator = _salaryMinTextControllerValidator;
    conditionsFieldTextControllerValidator =
        _conditionsFieldTextControllerValidator;
    cityFieldTextControllerValidator = _cityFieldTextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerDesktopModel.dispose();
    headerMobileOpenModel.dispose();
    dolzhnostFieldFocusNode?.dispose();
    dolzhnostFieldTextController?.dispose();

    aboutDolzhnostFieldFocusNode?.dispose();
    aboutDolzhnostFieldTextController?.dispose();

    trebovaniyaFieldFocusNode?.dispose();
    trebovaniyaFieldTextController?.dispose();

    skillInputFocusNode?.dispose();
    skillInputTextController?.dispose();

    salaryMinFocusNode?.dispose();
    salaryMinTextController?.dispose();

    salaryMaxFocusNode?.dispose();
    salaryMaxTextController?.dispose();

    conditionsFieldFocusNode?.dispose();
    conditionsFieldTextController?.dispose();

    linkFieldFocusNode?.dispose();
    linkFieldTextController?.dispose();

    cityFieldFocusNode?.dispose();
    cityFieldTextController?.dispose();

    workAdressFieldFocusNode?.dispose();
    workAdressFieldTextController?.dispose();

    footerModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
