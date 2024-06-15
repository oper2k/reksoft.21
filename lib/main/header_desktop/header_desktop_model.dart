import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/placeholders/notify_icon_placeholder/notify_icon_placeholder_widget.dart';
import '/profile/profile_components/upload_resume/upload_resume_widget.dart';
import 'header_desktop_widget.dart' show HeaderDesktopWidget;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HeaderDesktopModel extends FlutterFlowModel<HeaderDesktopWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for notifyIconPlaceholder component.
  late NotifyIconPlaceholderModel notifyIconPlaceholderModel;

  @override
  void initState(BuildContext context) {
    notifyIconPlaceholderModel =
        createModel(context, () => NotifyIconPlaceholderModel());
  }

  @override
  void dispose() {
    notifyIconPlaceholderModel.dispose();
  }
}
