import '/flutter_flow/flutter_flow_util.dart';
import 'sales_page_widget.dart' show SalesPageWidget;
import 'package:flutter/material.dart';

class SalesPageModel extends FlutterFlowModel<SalesPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
