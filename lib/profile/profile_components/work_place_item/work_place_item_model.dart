import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'work_place_item_widget.dart' show WorkPlaceItemWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkPlaceItemModel extends FlutterFlowModel<WorkPlaceItemWidget> {
  ///  Local state fields for this component.

  DateTime? startWorkDate;

  DateTime? endWorkDate;

  List<String> skills = [];
  void addToSkills(String item) => skills.add(item);
  void removeFromSkills(String item) => skills.remove(item);
  void removeAtIndexFromSkills(int index) => skills.removeAt(index);
  void insertAtIndexInSkills(int index, String item) =>
      skills.insert(index, item);
  void updateSkillsAtIndex(int index, Function(String) updateFn) =>
      skills[index] = updateFn(skills[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for WorkNameField widget.
  FocusNode? workNameFieldFocusNode;
  TextEditingController? workNameFieldTextController;
  String? Function(BuildContext, String?)? workNameFieldTextControllerValidator;
  String? _workNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

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

  // State field(s) for StartWorkField widget.
  FocusNode? startWorkFieldFocusNode;
  TextEditingController? startWorkFieldTextController;
  String? Function(BuildContext, String?)?
      startWorkFieldTextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for EndWorkField widget.
  FocusNode? endWorkFieldFocusNode;
  TextEditingController? endWorkFieldTextController;
  String? Function(BuildContext, String?)? endWorkFieldTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for skillInput widget.
  FocusNode? skillInputFocusNode;
  TextEditingController? skillInputTextController;
  String? Function(BuildContext, String?)? skillInputTextControllerValidator;
  // State field(s) for ExperienceField widget.
  FocusNode? experienceFieldFocusNode;
  TextEditingController? experienceFieldTextController;
  String? Function(BuildContext, String?)?
      experienceFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    workNameFieldTextControllerValidator =
        _workNameFieldTextControllerValidator;
    dolzhnostFieldTextControllerValidator =
        _dolzhnostFieldTextControllerValidator;
  }

  @override
  void dispose() {
    workNameFieldFocusNode?.dispose();
    workNameFieldTextController?.dispose();

    dolzhnostFieldFocusNode?.dispose();
    dolzhnostFieldTextController?.dispose();

    startWorkFieldFocusNode?.dispose();
    startWorkFieldTextController?.dispose();

    endWorkFieldFocusNode?.dispose();
    endWorkFieldTextController?.dispose();

    skillInputFocusNode?.dispose();
    skillInputTextController?.dispose();

    experienceFieldFocusNode?.dispose();
    experienceFieldTextController?.dispose();
  }
}
