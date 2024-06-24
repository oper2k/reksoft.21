import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/info_message/info_message_widget.dart';
import '/placeholders/empty_available_times2/empty_available_times2_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'applicant_calendar_widget.dart' show ApplicantCalendarWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ApplicantCalendarModel extends FlutterFlowModel<ApplicantCalendarWidget> {
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

  DateTime? selectedDate;

  String? selectedTimeSlot;

  List<AvailableDatesStruct> lockedDates = [];
  void addToLockedDates(AvailableDatesStruct item) => lockedDates.add(item);
  void removeFromLockedDates(AvailableDatesStruct item) =>
      lockedDates.remove(item);
  void removeAtIndexFromLockedDates(int index) => lockedDates.removeAt(index);
  void insertAtIndexInLockedDates(int index, AvailableDatesStruct item) =>
      lockedDates.insert(index, item);
  void updateLockedDatesAtIndex(
          int index, Function(AvailableDatesStruct) updateFn) =>
      lockedDates[index] = updateFn(lockedDates[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
