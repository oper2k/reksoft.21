import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main/info_message/info_message_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'calendar_settings_widget.dart' show CalendarSettingsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendarSettingsModel extends FlutterFlowModel<CalendarSettingsWidget> {
  ///  Local state fields for this component.

  DateTime? dateStart;

  DateTime? dateEnd;

  List<String> morningHours = [];
  void addToMorningHours(String item) => morningHours.add(item);
  void removeFromMorningHours(String item) => morningHours.remove(item);
  void removeAtIndexFromMorningHours(int index) => morningHours.removeAt(index);
  void insertAtIndexInMorningHours(int index, String item) =>
      morningHours.insert(index, item);
  void updateMorningHoursAtIndex(int index, Function(String) updateFn) =>
      morningHours[index] = updateFn(morningHours[index]);

  List<String> dayHours = [];
  void addToDayHours(String item) => dayHours.add(item);
  void removeFromDayHours(String item) => dayHours.remove(item);
  void removeAtIndexFromDayHours(int index) => dayHours.removeAt(index);
  void insertAtIndexInDayHours(int index, String item) =>
      dayHours.insert(index, item);
  void updateDayHoursAtIndex(int index, Function(String) updateFn) =>
      dayHours[index] = updateFn(dayHours[index]);

  List<String> eveningHours = [];
  void addToEveningHours(String item) => eveningHours.add(item);
  void removeFromEveningHours(String item) => eveningHours.remove(item);
  void removeAtIndexFromEveningHours(int index) => eveningHours.removeAt(index);
  void insertAtIndexInEveningHours(int index, String item) =>
      eveningHours.insert(index, item);
  void updateEveningHoursAtIndex(int index, Function(String) updateFn) =>
      eveningHours[index] = updateFn(eveningHours[index]);

  List<String> weekends = [];
  void addToWeekends(String item) => weekends.add(item);
  void removeFromWeekends(String item) => weekends.remove(item);
  void removeAtIndexFromWeekends(int index) => weekends.removeAt(index);
  void insertAtIndexInWeekends(int index, String item) =>
      weekends.insert(index, item);
  void updateWeekendsAtIndex(int index, Function(String) updateFn) =>
      weekends[index] = updateFn(weekends[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for dateFrom widget.
  FocusNode? dateFromFocusNode;
  TextEditingController? dateFromTextController;
  String? Function(BuildContext, String?)? dateFromTextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for dateTo widget.
  FocusNode? dateToFocusNode;
  TextEditingController? dateToTextController;
  String? Function(BuildContext, String?)? dateToTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  List<String>? get choiceChipsValues1 => choiceChipsValueController1?.value;
  set choiceChipsValues1(List<String>? val) =>
      choiceChipsValueController1?.value = val;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  List<String>? get choiceChipsValues2 => choiceChipsValueController2?.value;
  set choiceChipsValues2(List<String>? val) =>
      choiceChipsValueController2?.value = val;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController3;
  List<String>? get choiceChipsValues3 => choiceChipsValueController3?.value;
  set choiceChipsValues3(List<String>? val) =>
      choiceChipsValueController3?.value = val;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController4;
  List<String>? get choiceChipsValues4 => choiceChipsValueController4?.value;
  set choiceChipsValues4(List<String>? val) =>
      choiceChipsValueController4?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dateFromFocusNode?.dispose();
    dateFromTextController?.dispose();

    dateToFocusNode?.dispose();
    dateToTextController?.dispose();
  }
}
