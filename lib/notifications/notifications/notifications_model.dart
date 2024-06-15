import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/footer/footer_widget.dart';
import '/main/header_desktop/header_desktop_widget.dart';
import '/main/header_mobile/header_mobile_widget.dart';
import '/placeholders/empty_notifications_list/empty_notifications_list_widget.dart';
import 'dart:async';
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  Local state fields for this page.

  NotificationsRecord? currentNotification;

  UsersRecord? sender;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HeaderDesktop component.
  late HeaderDesktopModel headerDesktopModel;
  // Model for HeaderMobile component.
  late HeaderMobileModel headerMobileModel;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  VacanciesRecord? vacancy;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerDesktopModel = createModel(context, () => HeaderDesktopModel());
    headerMobileModel = createModel(context, () => HeaderMobileModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerDesktopModel.dispose();
    headerMobileModel.dispose();
    footerModel.dispose();
  }
}
