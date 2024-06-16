import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main/footer/footer_widget.dart';
import '/main/header_desktop/header_desktop_widget.dart';
import '/main/header_mobile_open/header_mobile_open_widget.dart';
import '/main/info_message/info_message_widget.dart';
import '/placeholders/empty_responses_list/empty_responses_list_widget.dart';
import '/vacancy/vacancy_components/response_accept/response_accept_widget.dart';
import '/vacancy/vacancy_components/response_decline/response_decline_widget.dart';
import '/vacancy/vacancy_components/resume_a_iresults/resume_a_iresults_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'h_r_candidates_widget.dart' show HRCandidatesWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HRCandidatesModel extends FlutterFlowModel<HRCandidatesWidget> {
  ///  Local state fields for this page.

  String? responseFilter;

  String? vacancyFilter;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HeaderDesktop component.
  late HeaderDesktopModel headerDesktopModel;
  // Model for HeaderMobileOpen component.
  late HeaderMobileOpenModel headerMobileOpenModel;
  // State field(s) for vacancyFilter widget.
  String? vacancyFilterValue;
  FormFieldController<String>? vacancyFilterValueController;
  // Stores action output result for [Backend Call - API (Send email)] action in Button widget.
  ApiCallResponse? apiResultnma;
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
    footerModel.dispose();
  }
}
