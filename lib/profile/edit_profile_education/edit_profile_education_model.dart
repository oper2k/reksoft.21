import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/header_desktop/header_desktop_widget.dart';
import '/main/header_mobile/header_mobile_widget.dart';
import '/main/info_message/info_message_widget.dart';
import '/placeholders/empty_profile_data/empty_profile_data_widget.dart';
import '/profile/profile_components/education_item/education_item_widget.dart';
import 'edit_profile_education_widget.dart' show EditProfileEducationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileEducationModel
    extends FlutterFlowModel<EditProfileEducationWidget> {
  ///  Local state fields for this page.

  List<EducationPlaceStruct> educationPlaces = [];
  void addToEducationPlaces(EducationPlaceStruct item) =>
      educationPlaces.add(item);
  void removeFromEducationPlaces(EducationPlaceStruct item) =>
      educationPlaces.remove(item);
  void removeAtIndexFromEducationPlaces(int index) =>
      educationPlaces.removeAt(index);
  void insertAtIndexInEducationPlaces(int index, EducationPlaceStruct item) =>
      educationPlaces.insert(index, item);
  void updateEducationPlacesAtIndex(
          int index, Function(EducationPlaceStruct) updateFn) =>
      educationPlaces[index] = updateFn(educationPlaces[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HeaderDesktop component.
  late HeaderDesktopModel headerDesktopModel;
  // Model for HeaderMobile component.
  late HeaderMobileModel headerMobileModel;

  @override
  void initState(BuildContext context) {
    headerDesktopModel = createModel(context, () => HeaderDesktopModel());
    headerMobileModel = createModel(context, () => HeaderMobileModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerDesktopModel.dispose();
    headerMobileModel.dispose();
  }
}
