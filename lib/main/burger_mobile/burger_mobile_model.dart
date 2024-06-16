import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/header_mobile_close/header_mobile_close_widget.dart';
import '/profile/profile_components/upload_resume/upload_resume_widget.dart';
import 'burger_mobile_widget.dart' show BurgerMobileWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BurgerMobileModel extends FlutterFlowModel<BurgerMobileWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for HeaderMobileClose component.
  late HeaderMobileCloseModel headerMobileCloseModel;

  @override
  void initState(BuildContext context) {
    headerMobileCloseModel =
        createModel(context, () => HeaderMobileCloseModel());
  }

  @override
  void dispose() {
    headerMobileCloseModel.dispose();
  }
}
