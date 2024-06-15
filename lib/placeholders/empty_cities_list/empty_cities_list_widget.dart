import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_cities_list_model.dart';
export 'empty_cities_list_model.dart';

class EmptyCitiesListWidget extends StatefulWidget {
  const EmptyCitiesListWidget({super.key});

  @override
  State<EmptyCitiesListWidget> createState() => _EmptyCitiesListWidgetState();
}

class _EmptyCitiesListWidgetState extends State<EmptyCitiesListWidget> {
  late EmptyCitiesListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyCitiesListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Городов не найдено...',
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
            color: Color(0xFF707085),
            fontSize: 14.0,
            letterSpacing: 0.0,
            fontWeight: FontWeight.normal,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
          ),
    );
  }
}
