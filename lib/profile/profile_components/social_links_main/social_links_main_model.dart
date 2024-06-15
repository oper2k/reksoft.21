import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/profile_components/social_links_field/social_links_field_widget.dart';
import 'social_links_main_widget.dart' show SocialLinksMainWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SocialLinksMainModel extends FlutterFlowModel<SocialLinksMainWidget> {
  ///  Local state fields for this component.

  List<String> data = [];
  void addToData(String item) => data.add(item);
  void removeFromData(String item) => data.remove(item);
  void removeAtIndexFromData(int index) => data.removeAt(index);
  void insertAtIndexInData(int index, String item) => data.insert(index, item);
  void updateDataAtIndex(int index, Function(String) updateFn) =>
      data[index] = updateFn(data[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
