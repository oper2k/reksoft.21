import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/info_message/info_message_widget.dart';
import '/vacancy/vacancy_response/vacancy_response_widget.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vacancy_response_btn_model.dart';
export 'vacancy_response_btn_model.dart';

class VacancyResponseBtnWidget extends StatefulWidget {
  const VacancyResponseBtnWidget({
    super.key,
    required this.vacancy,
  });

  final VacanciesRecord? vacancy;

  @override
  State<VacancyResponseBtnWidget> createState() =>
      _VacancyResponseBtnWidgetState();
}

class _VacancyResponseBtnWidgetState extends State<VacancyResponseBtnWidget> {
  late VacancyResponseBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VacancyResponseBtnModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => FFButtonWidget(
        onPressed: () async {
          if ((currentUserDocument?.responsedVacanciesList?.toList() ?? [])
              .contains(widget.vacancy?.reference)) {
            showDialog(
              barrierColor: FlutterFlowTheme.of(context).modalBgnd,
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: InfoMessageWidget(
                    text:
                        'Вы уже откликались на эту вакансию. Дождитесь ответа рекрутера',
                    isError: true,
                  ),
                );
              },
            ).then((value) => setState(() {}));

            return;
          }
          if (valueOrDefault(currentUserDocument?.role, '') == 'applicant') {
            unawaited(
              () async {
                await widget.vacancy!.reference.update({
                  ...mapToFirestore(
                    {
                      'views_count': FieldValue.increment(1),
                    },
                  ),
                });
              }(),
            );
          }
          await showDialog(
            barrierColor: FlutterFlowTheme.of(context).modalBgnd,
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: VacancyResponseWidget(
                  vacancy: widget.vacancy!,
                ),
              );
            },
          ).then((value) => setState(() {}));
        },
        text: 'Откликнуться',
        options: FFButtonOptions(
          width: 184.0,
          height: 50.0,
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: FlutterFlowTheme.of(context).primary,
          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                color: Colors.white,
                fontSize: 15.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
              ),
          elevation: 0.0,
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }
}
