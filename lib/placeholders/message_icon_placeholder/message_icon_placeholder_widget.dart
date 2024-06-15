import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'message_icon_placeholder_model.dart';
export 'message_icon_placeholder_model.dart';

class MessageIconPlaceholderWidget extends StatefulWidget {
  const MessageIconPlaceholderWidget({super.key});

  @override
  State<MessageIconPlaceholderWidget> createState() =>
      _MessageIconPlaceholderWidgetState();
}

class _MessageIconPlaceholderWidgetState
    extends State<MessageIconPlaceholderWidget> {
  late MessageIconPlaceholderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageIconPlaceholderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.chat_bubble_rounded,
      color: FlutterFlowTheme.of(context).gray,
      size: 24.0,
    );
  }
}
