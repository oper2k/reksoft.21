import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notify_icon_placeholder_model.dart';
export 'notify_icon_placeholder_model.dart';

class NotifyIconPlaceholderWidget extends StatefulWidget {
  const NotifyIconPlaceholderWidget({
    super.key,
    Color? color,
  }) : this.color = color ?? const Color(0xFFA7B4CC);

  final Color color;

  @override
  State<NotifyIconPlaceholderWidget> createState() =>
      _NotifyIconPlaceholderWidgetState();
}

class _NotifyIconPlaceholderWidgetState
    extends State<NotifyIconPlaceholderWidget> {
  late NotifyIconPlaceholderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotifyIconPlaceholderModel());

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
      Icons.notifications_sharp,
      color: widget.color,
      size: 24.0,
    );
  }
}
