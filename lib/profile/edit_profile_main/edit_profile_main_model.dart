import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main/header_desktop/header_desktop_widget.dart';
import '/main/header_mobile/header_mobile_widget.dart';
import '/main/info_message/info_message_widget.dart';
import '/profile/profile_components/social_links_main/social_links_main_widget.dart';
import 'dart:async';
import 'edit_profile_main_widget.dart' show EditProfileMainWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class EditProfileMainModel extends FlutterFlowModel<EditProfileMainWidget> {
  ///  Local state fields for this page.

  List<String> socialLinks = [];
  void addToSocialLinks(String item) => socialLinks.add(item);
  void removeFromSocialLinks(String item) => socialLinks.remove(item);
  void removeAtIndexFromSocialLinks(int index) => socialLinks.removeAt(index);
  void insertAtIndexInSocialLinks(int index, String item) =>
      socialLinks.insert(index, item);
  void updateSocialLinksAtIndex(int index, Function(String) updateFn) =>
      socialLinks[index] = updateFn(socialLinks[index]);

  String? selectedCity;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for HeaderDesktop component.
  late HeaderDesktopModel headerDesktopModel;
  // Model for HeaderMobile component.
  late HeaderMobileModel headerMobileModel;
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  String? _nameFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  // State field(s) for SurnameField widget.
  FocusNode? surnameFieldFocusNode;
  TextEditingController? surnameFieldTextController;
  String? Function(BuildContext, String?)? surnameFieldTextControllerValidator;
  String? _surnameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  // State field(s) for BirthDateField widget.
  FocusNode? birthDateFieldFocusNode;
  TextEditingController? birthDateFieldTextController;
  String? Function(BuildContext, String?)?
      birthDateFieldTextControllerValidator;
  String? _birthDateFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for languages widget.
  FocusNode? languagesFocusNode;
  TextEditingController? languagesTextController;
  String? Function(BuildContext, String?)? languagesTextControllerValidator;
  String? _languagesTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

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
  // State field(s) for WorkFormat widget.
  String? workFormatValue;
  FormFieldController<String>? workFormatValueController;
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  String? _emailFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  // State field(s) for PhoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldTextController;
  final phoneFieldMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneFieldTextControllerValidator;
  String? _phoneFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  // State field(s) for website widget.
  FocusNode? websiteFocusNode;
  TextEditingController? websiteTextController;
  String? Function(BuildContext, String?)? websiteTextControllerValidator;
  // Model for socialLinks_main component.
  late SocialLinksMainModel socialLinksMainModel;

  @override
  void initState(BuildContext context) {
    headerDesktopModel = createModel(context, () => HeaderDesktopModel());
    headerMobileModel = createModel(context, () => HeaderMobileModel());
    nameFieldTextControllerValidator = _nameFieldTextControllerValidator;
    surnameFieldTextControllerValidator = _surnameFieldTextControllerValidator;
    birthDateFieldTextControllerValidator =
        _birthDateFieldTextControllerValidator;
    languagesTextControllerValidator = _languagesTextControllerValidator;
    cityFieldTextControllerValidator = _cityFieldTextControllerValidator;
    emailFieldTextControllerValidator = _emailFieldTextControllerValidator;
    phoneFieldTextControllerValidator = _phoneFieldTextControllerValidator;
    socialLinksMainModel = createModel(context, () => SocialLinksMainModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerDesktopModel.dispose();
    headerMobileModel.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    surnameFieldFocusNode?.dispose();
    surnameFieldTextController?.dispose();

    birthDateFieldFocusNode?.dispose();
    birthDateFieldTextController?.dispose();

    languagesFocusNode?.dispose();
    languagesTextController?.dispose();

    cityFieldFocusNode?.dispose();
    cityFieldTextController?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    phoneFieldFocusNode?.dispose();
    phoneFieldTextController?.dispose();

    websiteFocusNode?.dispose();
    websiteTextController?.dispose();

    socialLinksMainModel.dispose();
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
