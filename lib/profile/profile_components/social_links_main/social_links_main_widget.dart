import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/profile_components/social_links_field/social_links_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'social_links_main_model.dart';
export 'social_links_main_model.dart';

class SocialLinksMainWidget extends StatefulWidget {
  const SocialLinksMainWidget({
    super.key,
    this.initialData,
  });

  final List<String>? initialData;

  @override
  State<SocialLinksMainWidget> createState() => _SocialLinksMainWidgetState();
}

class _SocialLinksMainWidgetState extends State<SocialLinksMainWidget> {
  late SocialLinksMainModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialLinksMainModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.data = widget.initialData!.toList().cast<String>();
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Builder(
            builder: (context) {
              final link = _model.data.toList();
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(link.length, (linkIndex) {
                  final linkItem = link[linkIndex];
                  return Stack(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    children: [
                      SocialLinksFieldWidget(
                        key: Key('Key3ky_${linkIndex}_of_${link.length}'),
                        initialValue: linkItem,
                        onChangeAction: (text) async {
                          _model.updateDataAtIndex(
                            linkIndex,
                            (_) => text!,
                          );
                          setState(() {});
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.delete_outline_rounded,
                            color: FlutterFlowTheme.of(context).gray,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            _model.removeAtIndexFromData(linkIndex);
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  );
                }).divide(SizedBox(height: 8.0)),
              );
            },
          ),
        ),
        Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                _model.addToData('');
                setState(() {});
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 16.0,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 6.0, 0.0, 6.0),
                    child: Text(
                      'Добавить ссылку ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
