import '/flutter_flow/flutter_flow_util.dart';
import 'sell_item_widget.dart' show SellItemWidget;
import 'package:flutter/material.dart';

class SellItemModel extends FlutterFlowModel<SellItemWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for sellPriceInput widget.
  FocusNode? sellPriceInputFocusNode;
  TextEditingController? sellPriceInputController;
  String? Function(BuildContext, String?)? sellPriceInputControllerValidator;
  // State field(s) for amountSoldInput widget.
  FocusNode? amountSoldInputFocusNode;
  TextEditingController? amountSoldInputController;
  String? Function(BuildContext, String?)? amountSoldInputControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    sellPriceInputFocusNode?.dispose();
    sellPriceInputController?.dispose();

    amountSoldInputFocusNode?.dispose();
    amountSoldInputController?.dispose();
  }
}
