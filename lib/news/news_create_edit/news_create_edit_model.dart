import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/footer/footer_widget.dart';
import '/main/header_desktop/header_desktop_widget.dart';
import '/main/header_mobile_open/header_mobile_open_widget.dart';
import '/main/info_message/info_message_widget.dart';
import '/news/news_components/upload_image/upload_image_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'news_create_edit_widget.dart' show NewsCreateEditWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewsCreateEditModel extends FlutterFlowModel<NewsCreateEditWidget> {
  ///  Local state fields for this page.

  String? image;

  List<String> hashtags = [];
  void addToHashtags(String item) => hashtags.add(item);
  void removeFromHashtags(String item) => hashtags.remove(item);
  void removeAtIndexFromHashtags(int index) => hashtags.removeAt(index);
  void insertAtIndexInHashtags(int index, String item) =>
      hashtags.insert(index, item);
  void updateHashtagsAtIndex(int index, Function(String) updateFn) =>
      hashtags[index] = updateFn(hashtags[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for HeaderDesktop component.
  late HeaderDesktopModel headerDesktopModel;
  // Model for HeaderMobileOpen component.
  late HeaderMobileOpenModel headerMobileOpenModel;
  // State field(s) for NewsName widget.
  FocusNode? newsNameFocusNode;
  TextEditingController? newsNameTextController;
  String? Function(BuildContext, String?)? newsNameTextControllerValidator;
  String? _newsNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  // State field(s) for shortDescription widget.
  FocusNode? shortDescriptionFocusNode;
  TextEditingController? shortDescriptionTextController;
  String? Function(BuildContext, String?)?
      shortDescriptionTextControllerValidator;
  String? _shortDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  // State field(s) for content widget.
  FocusNode? contentFocusNode;
  TextEditingController? contentTextController;
  String? Function(BuildContext, String?)? contentTextControllerValidator;
  String? _contentTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  // State field(s) for skillInput widget.
  FocusNode? skillInputFocusNode;
  TextEditingController? skillInputTextController;
  String? Function(BuildContext, String?)? skillInputTextControllerValidator;
  DateTime? datePicked;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerDesktopModel = createModel(context, () => HeaderDesktopModel());
    headerMobileOpenModel = createModel(context, () => HeaderMobileOpenModel());
    newsNameTextControllerValidator = _newsNameTextControllerValidator;
    shortDescriptionTextControllerValidator =
        _shortDescriptionTextControllerValidator;
    contentTextControllerValidator = _contentTextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerDesktopModel.dispose();
    headerMobileOpenModel.dispose();
    newsNameFocusNode?.dispose();
    newsNameTextController?.dispose();

    shortDescriptionFocusNode?.dispose();
    shortDescriptionTextController?.dispose();

    contentFocusNode?.dispose();
    contentTextController?.dispose();

    skillInputFocusNode?.dispose();
    skillInputTextController?.dispose();

    footerModel.dispose();
  }
}
