import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'social_links_field_model.dart';
export 'social_links_field_model.dart';

class SocialLinksFieldWidget extends StatefulWidget {
  const SocialLinksFieldWidget({
    super.key,
    this.initialValue,
    required this.onChangeAction,
    this.index,
  });

  final String? initialValue;
  final Future Function(String? text)? onChangeAction;
  final int? index;

  @override
  State<SocialLinksFieldWidget> createState() => _SocialLinksFieldWidgetState();
}

class _SocialLinksFieldWidgetState extends State<SocialLinksFieldWidget> {
  late SocialLinksFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialLinksFieldModel());

    _model.linkFieldTextController ??=
        TextEditingController(text: widget.initialValue);
    _model.linkFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _model.linkFieldTextController,
      focusNode: _model.linkFieldFocusNode,
      onChanged: (_) => EasyDebounce.debounce(
        '_model.linkFieldTextController',
        Duration(milliseconds: 100),
        () async {
          await widget.onChangeAction?.call(
            _model.linkFieldTextController.text,
          );
        },
      ),
      autofocus: false,
      textInputAction: TextInputAction.next,
      obscureText: false,
      decoration: InputDecoration(
        hintText: 'mariii@gmail.com',
        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
              color: FlutterFlowTheme.of(context).gray,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).lightGray1,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 50.0, 0.0),
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
            color: widget.index == 0
                ? Colors.black
                : FlutterFlowTheme.of(context).primaryText,
            fontSize: 15.0,
            letterSpacing: 0.0,
            fontWeight: FontWeight.w500,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
          ),
      cursorColor: FlutterFlowTheme.of(context).primaryText,
      validator: _model.linkFieldTextControllerValidator.asValidator(context),
    );
  }
}
