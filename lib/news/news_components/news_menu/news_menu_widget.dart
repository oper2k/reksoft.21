import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/news/news_components/delete_news/delete_news_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'news_menu_model.dart';
export 'news_menu_model.dart';

class NewsMenuWidget extends StatefulWidget {
  const NewsMenuWidget({
    super.key,
    required this.newsDoc,
  });

  final NewsRecord? newsDoc;

  @override
  State<NewsMenuWidget> createState() => _NewsMenuWidgetState();
}

class _NewsMenuWidgetState extends State<NewsMenuWidget> {
  late NewsMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsMenuModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: 592.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 24.0, 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FFButtonWidget(
                onPressed: () async {
                  context.pushNamed(
                    'News_createEdit',
                    queryParameters: {
                      'newsDoc': serializeParam(
                        widget.newsDoc,
                        ParamType.Document,
                      ),
                      'isEdit': serializeParam(
                        true,
                        ParamType.bool,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'newsDoc': widget.newsDoc,
                    },
                  );
                },
                text: 'Редактировать',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0x003378FF),
                  textStyle: FlutterFlowTheme.of(context)
                      .headlineMedium
                      .override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineMediumFamily,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineMediumFamily),
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                  hoverColor: FlutterFlowTheme.of(context).lightGray1,
                ),
              ),
              Builder(
                builder: (context) => FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                    await showDialog(
                      barrierColor: FlutterFlowTheme.of(context).customColor1,
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: DeleteNewsWidget(
                            newsRef: widget.newsDoc!.reference,
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  text: 'Удалить',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0x003378FF),
                    textStyle: FlutterFlowTheme.of(context)
                        .headlineMedium
                        .override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineMediumFamily,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context)
                                  .headlineMediumFamily),
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                    hoverColor: FlutterFlowTheme.of(context).lightGray1,
                  ),
                ),
              ),
            ].divide(SizedBox(height: 32.0)),
          ),
        ),
      ),
    );
  }
}
