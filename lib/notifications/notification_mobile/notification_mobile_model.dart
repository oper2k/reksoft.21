import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/header_mobile/header_mobile_widget.dart';
import 'notification_mobile_widget.dart' show NotificationMobileWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationMobileModel
    extends FlutterFlowModel<NotificationMobileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HeaderMobile component.
  late HeaderMobileModel headerMobileModel;

  @override
  void initState(BuildContext context) {
    headerMobileModel = createModel(context, () => HeaderMobileModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerMobileModel.dispose();
  }
}
