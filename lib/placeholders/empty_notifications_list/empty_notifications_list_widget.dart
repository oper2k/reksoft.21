import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_notifications_list_model.dart';
export 'empty_notifications_list_model.dart';

class EmptyNotificationsListWidget extends StatefulWidget {
  const EmptyNotificationsListWidget({super.key});

  @override
  State<EmptyNotificationsListWidget> createState() =>
      _EmptyNotificationsListWidgetState();
}

class _EmptyNotificationsListWidgetState
    extends State<EmptyNotificationsListWidget> {
  late EmptyNotificationsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyNotificationsListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
      child: Text(
        'Нет новых уведомлений...',
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
              fontSize: 16.0,
              letterSpacing: 0.0,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
            ),
      ),
    );
  }
}
