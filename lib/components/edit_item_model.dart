import '/flutter_flow/flutter_flow_util.dart';
import 'edit_item_widget.dart' show EditItemWidget;
import 'package:flutter/material.dart';

class EditItemModel extends FlutterFlowModel<EditItemWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for descriptionInput widget.
  FocusNode? descriptionInputFocusNode;
  TextEditingController? descriptionInputController;
  String? Function(BuildContext, String?)? descriptionInputControllerValidator;
  // State field(s) for quantityInput widget.
  int? quantityInputValue;
  // State field(s) for buyPriceInput widget.
  FocusNode? buyPriceInputFocusNode;
  TextEditingController? buyPriceInputController;
  String? Function(BuildContext, String?)? buyPriceInputControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descriptionInputFocusNode?.dispose();
    descriptionInputController?.dispose();

    buyPriceInputFocusNode?.dispose();
    buyPriceInputController?.dispose();
  }
}
