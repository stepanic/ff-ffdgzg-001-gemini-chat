import '/backend/api_requests/api_calls.dart';
import '/components/top_header/top_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'gemini_widget.dart' show GeminiWidget;
import 'package:flutter/material.dart';

class GeminiModel extends FlutterFlowModel<GeminiWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for top_header component.
  late TopHeaderModel topHeaderModel;
  // State field(s) for chat_listview_scrollable widget.
  ScrollController? chatListviewScrollable;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Gemini)] action in TextField widget.
  ApiCallResponse? response;

  @override
  void initState(BuildContext context) {
    topHeaderModel = createModel(context, () => TopHeaderModel());
    chatListviewScrollable = ScrollController();
  }

  @override
  void dispose() {
    topHeaderModel.dispose();
    chatListviewScrollable?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
