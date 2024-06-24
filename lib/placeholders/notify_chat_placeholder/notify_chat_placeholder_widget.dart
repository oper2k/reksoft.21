import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notify_chat_placeholder_model.dart';
export 'notify_chat_placeholder_model.dart';

class NotifyChatPlaceholderWidget extends StatefulWidget {
  const NotifyChatPlaceholderWidget({
    super.key,
    bool? isActive,
  }) : this.isActive = isActive ?? false;

  final bool isActive;

  @override
  State<NotifyChatPlaceholderWidget> createState() =>
      _NotifyChatPlaceholderWidgetState();
}

class _NotifyChatPlaceholderWidgetState
    extends State<NotifyChatPlaceholderWidget> {
  late NotifyChatPlaceholderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotifyChatPlaceholderModel());

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
      FFIcons.ktalk,
      color: widget.isActive
          ? FlutterFlowTheme.of(context).primaryText
          : FlutterFlowTheme.of(context).gray,
      size: 24.0,
    );
  }
}
