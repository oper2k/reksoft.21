import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/main/header_desktop/header_desktop_widget.dart';
import '/main/header_mobile/header_mobile_widget.dart';
import '/main/info_message/info_message_widget.dart';
import '/placeholders/empty_profile_data/empty_profile_data_widget.dart';
import '/profile/profile_components/change_password/change_password_widget.dart';
import '/profile/profile_components/delete_account/delete_account_widget.dart';
import '/profile/profile_components/delete_resume/delete_resume_widget.dart';
import '/profile/profile_components/log_out/log_out_widget.dart';
import '/profile/profile_components/upload_resume/upload_resume_widget.dart';
import 'dart:async';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'profile_widget.dart' show ProfileWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HeaderDesktop component.
  late HeaderDesktopModel headerDesktopModel;
  // Model for HeaderMobile component.
  late HeaderMobileModel headerMobileModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  VacanciesRecord? vacancy;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for PhoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldTextController;
  final phoneFieldMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneFieldTextControllerValidator;

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
    phoneFieldFocusNode?.dispose();
    phoneFieldTextController?.dispose();
  }
}
