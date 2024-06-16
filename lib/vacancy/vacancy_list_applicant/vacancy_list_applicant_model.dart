import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main/footer/footer_widget.dart';
import '/main/header_desktop/header_desktop_widget.dart';
import '/main/header_mobile_open/header_mobile_open_widget.dart';
import '/main/info_message/info_message_widget.dart';
import '/placeholders/empty_news_list/empty_news_list_widget.dart';
import '/profile/profile_components/upload_resume/upload_resume_widget.dart';
import '/vacancy/vacancy_components/filter_mobile/filter_mobile_widget.dart';
import '/vacancy/vacancy_components/vacancy_response_btn/vacancy_response_btn_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'vacancy_list_applicant_widget.dart' show VacancyListApplicantWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VacancyListApplicantModel
    extends FlutterFlowModel<VacancyListApplicantWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HeaderDesktop component.
  late HeaderDesktopModel headerDesktopModel;
  // Model for HeaderMobileOpen component.
  late HeaderMobileOpenModel headerMobileOpenModel;
  // State field(s) for keywordsSearch widget.
  FocusNode? keywordsSearchFocusNode;
  TextEditingController? keywordsSearchTextController;
  String? Function(BuildContext, String?)?
      keywordsSearchTextControllerValidator;
  // State field(s) for specializations widget.
  String? specializationsValue;
  FormFieldController<String>? specializationsValueController;
  // State field(s) for employmentType widget.
  String? employmentTypeValue;
  FormFieldController<String>? employmentTypeValueController;
  // State field(s) for workFormat widget.
  String? workFormatValue;
  FormFieldController<String>? workFormatValueController;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerDesktopModel = createModel(context, () => HeaderDesktopModel());
    headerMobileOpenModel = createModel(context, () => HeaderMobileOpenModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerDesktopModel.dispose();
    headerMobileOpenModel.dispose();
    keywordsSearchFocusNode?.dispose();
    keywordsSearchTextController?.dispose();

    footerModel.dispose();
  }
}
