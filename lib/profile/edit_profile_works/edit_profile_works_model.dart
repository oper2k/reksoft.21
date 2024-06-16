import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/header_desktop/header_desktop_widget.dart';
import '/main/header_mobile_open/header_mobile_open_widget.dart';
import '/main/info_message/info_message_widget.dart';
import '/placeholders/empty_profile_data/empty_profile_data_widget.dart';
import '/profile/profile_components/work_place_item/work_place_item_widget.dart';
import 'edit_profile_works_widget.dart' show EditProfileWorksWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileWorksModel extends FlutterFlowModel<EditProfileWorksWidget> {
  ///  Local state fields for this page.

  List<WorkPlaceStruct> workPlaces = [];
  void addToWorkPlaces(WorkPlaceStruct item) => workPlaces.add(item);
  void removeFromWorkPlaces(WorkPlaceStruct item) => workPlaces.remove(item);
  void removeAtIndexFromWorkPlaces(int index) => workPlaces.removeAt(index);
  void insertAtIndexInWorkPlaces(int index, WorkPlaceStruct item) =>
      workPlaces.insert(index, item);
  void updateWorkPlacesAtIndex(int index, Function(WorkPlaceStruct) updateFn) =>
      workPlaces[index] = updateFn(workPlaces[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HeaderDesktop component.
  late HeaderDesktopModel headerDesktopModel;
  // Model for HeaderMobileOpen component.
  late HeaderMobileOpenModel headerMobileOpenModel;

  @override
  void initState(BuildContext context) {
    headerDesktopModel = createModel(context, () => HeaderDesktopModel());
    headerMobileOpenModel = createModel(context, () => HeaderMobileOpenModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerDesktopModel.dispose();
    headerMobileOpenModel.dispose();
  }
}
