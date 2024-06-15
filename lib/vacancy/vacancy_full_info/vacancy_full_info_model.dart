import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/footer/footer_widget.dart';
import '/main/header_desktop/header_desktop_widget.dart';
import '/main/header_mobile/header_mobile_widget.dart';
import '/main/info_message/info_message_widget.dart';
import '/vacancy/vacancy_components/vacancy_response_btn/vacancy_response_btn_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'vacancy_full_info_widget.dart' show VacancyFullInfoWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class VacancyFullInfoModel extends FlutterFlowModel<VacancyFullInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HeaderDesktop component.
  late HeaderDesktopModel headerDesktopModel;
  // Model for HeaderMobile component.
  late HeaderMobileModel headerMobileModel;
  // Model for vacancyResponseBtn component.
  late VacancyResponseBtnModel vacancyResponseBtnModel1;
  // Model for vacancyResponseBtn component.
  late VacancyResponseBtnModel vacancyResponseBtnModel2;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerDesktopModel = createModel(context, () => HeaderDesktopModel());
    headerMobileModel = createModel(context, () => HeaderMobileModel());
    vacancyResponseBtnModel1 =
        createModel(context, () => VacancyResponseBtnModel());
    vacancyResponseBtnModel2 =
        createModel(context, () => VacancyResponseBtnModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerDesktopModel.dispose();
    headerMobileModel.dispose();
    vacancyResponseBtnModel1.dispose();
    vacancyResponseBtnModel2.dispose();
    footerModel.dispose();
  }
}
