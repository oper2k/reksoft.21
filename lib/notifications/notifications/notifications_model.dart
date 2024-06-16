import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/footer/footer_widget.dart';
import '/main/header_desktop/header_desktop_widget.dart';
import '/main/header_mobile_open/header_mobile_open_widget.dart';
import '/main/info_message/info_message_widget.dart';
import '/placeholders/empty_notifications_list/empty_notifications_list_widget.dart';
import '/vacancy/vacancy_components/response_accept/response_accept_widget.dart';
import 'dart:async';
import 'dart:math';
import '/flutter_flow/request_manager.dart';

import 'notifications_widget.dart' show NotificationsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  Local state fields for this page.

  NotificationsRecord? currentNotification;

  UsersRecord? sender;

  bool showPanelMobile = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HeaderDesktop component.
  late HeaderDesktopModel headerDesktopModel;
  // Model for HeaderMobileOpen component.
  late HeaderMobileOpenModel headerMobileOpenModel;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  VacanciesRecord? vacancy;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  VacanciesRecord? vacancyItem;
  // Model for Footer component.
  late FooterModel footerModel;

  /// Query cache managers for this widget.

  final _notificationsManager =
      StreamRequestManager<List<NotificationsRecord>>();
  Stream<List<NotificationsRecord>> notifications({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<NotificationsRecord>> Function() requestFn,
  }) =>
      _notificationsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNotificationsCache() => _notificationsManager.clear();
  void clearNotificationsCacheKey(String? uniqueKey) =>
      _notificationsManager.clearRequest(uniqueKey);

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

    /// Dispose query cache managers for this widget.

    clearNotificationsCache();
  }
}
