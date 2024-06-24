import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_available_times2_model.dart';
export 'empty_available_times2_model.dart';

class EmptyAvailableTimes2Widget extends StatefulWidget {
  const EmptyAvailableTimes2Widget({super.key});

  @override
  State<EmptyAvailableTimes2Widget> createState() =>
      _EmptyAvailableTimes2WidgetState();
}

class _EmptyAvailableTimes2WidgetState
    extends State<EmptyAvailableTimes2Widget> {
  late EmptyAvailableTimes2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyAvailableTimes2Model());

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
        'Нет свободных дат в ближайшее время...',
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
              color: FlutterFlowTheme.of(context).error,
              fontSize: 14.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.normal,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
            ),
      ),
    );
  }
}
