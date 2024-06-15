import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/footer/footer_widget.dart';
import '/main/header_desktop/header_desktop_widget.dart';
import '/main/header_mobile/header_mobile_widget.dart';
import '/main/info_message/info_message_widget.dart';
import 'dart:async';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'chat_page_widget.dart' show ChatPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatPageModel extends FlutterFlowModel<ChatPageWidget> {
  ///  Local state fields for this page.

  String? inputContent;

  bool showPanel = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Send Full Prompt)] action in Chat_Page widget.
  ApiCallResponse? chatGPTResponse23Copy;
  // Model for HeaderDesktop component.
  late HeaderDesktopModel headerDesktopModel;
  // Model for HeaderMobile component.
  late HeaderMobileModel headerMobileModel;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for messageField widget.
  FocusNode? messageFieldFocusNode;
  TextEditingController? messageFieldTextController;
  String? Function(BuildContext, String?)? messageFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (Send Full Prompt)] action in messageField widget.
  ApiCallResponse? chatGPTResponse23;
  // Stores action output result for [Backend Call - API (Analyse Chat)] action in Button widget.
  ApiCallResponse? analysechatresp;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerDesktopModel = createModel(context, () => HeaderDesktopModel());
    headerMobileModel = createModel(context, () => HeaderMobileModel());
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerDesktopModel.dispose();
    headerMobileModel.dispose();
    columnController1?.dispose();
    columnController2?.dispose();
    messageFieldFocusNode?.dispose();
    messageFieldTextController?.dispose();

    footerModel.dispose();
  }
}
