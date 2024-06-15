import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'education_item_widget.dart' show EducationItemWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EducationItemModel extends FlutterFlowModel<EducationItemWidget> {
  ///  Local state fields for this component.

  String? university;

  String? faculty;

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
  // State field(s) for university widget.
  FocusNode? universityFocusNode;
  TextEditingController? universityTextController;
  String? Function(BuildContext, String?)? universityTextControllerValidator;
  String? _universityTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  // State field(s) for faculty widget.
  FocusNode? facultyFocusNode;
  TextEditingController? facultyTextController;
  String? Function(BuildContext, String?)? facultyTextControllerValidator;
  String? _facultyTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  // State field(s) for skillInput widget.
  FocusNode? skillInputFocusNode;
  TextEditingController? skillInputTextController;
  String? Function(BuildContext, String?)? skillInputTextControllerValidator;

  @override
  void initState(BuildContext context) {
    universityTextControllerValidator = _universityTextControllerValidator;
    facultyTextControllerValidator = _facultyTextControllerValidator;
  }

  @override
  void dispose() {
    universityFocusNode?.dispose();
    universityTextController?.dispose();

    facultyFocusNode?.dispose();
    facultyTextController?.dispose();

    skillInputFocusNode?.dispose();
    skillInputTextController?.dispose();
  }
}
