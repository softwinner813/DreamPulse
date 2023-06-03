import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? inputContent;

  dynamic chatHistory;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Send Full Prompt)] action in chatPage widget.
  ApiCallResponse? chatGPTResponseFirst;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Send Full Prompt)] action in IconButton widget.
  ApiCallResponse? chatGPTResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  void dispose() {
    listViewController?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods are added here.

}
