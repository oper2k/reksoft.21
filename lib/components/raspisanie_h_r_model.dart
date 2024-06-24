import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'raspisanie_h_r_widget.dart' show RaspisanieHRWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RaspisanieHRModel extends FlutterFlowModel<RaspisanieHRWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
