import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/info_message/info_message_widget.dart';
import 'package:flutter/material.dart';

Future showInfoMessage(
  BuildContext context, {
  required String? text,
  bool? isError,
}) async {
  showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        child: InfoMessageWidget(
          text: text!,
          isError: isError,
        ),
      );
    },
  );
}

Future uploadPDF(BuildContext context) async {}
