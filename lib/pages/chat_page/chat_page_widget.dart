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
import 'chat_page_model.dart';
import 'package:lottie/lottie.dart';
export 'chat_page_model.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    Key? key,
    this.chatUser,
    this.chatRef,
    this.startMsg,
    bool? loading,
  })  : this.loading = loading ?? true,
        super(key: key);

  final UsersRecord? chatUser;
  final DocumentReference? chatRef;
  final String? startMsg;
  final bool loading;

  @override
  _ChatPageWidgetState createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  bool requested = false;
  String stateMsg = "Go ahead, I\'m ready.";
  late ChatPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.startMsg != null && widget.startMsg != "") {
        setState(() {
          requested = true;
          stateMsg = "Generating answer...";
          _model.chatHistory = functions.saveChatHistory(
              _model.chatHistory, functions.convertToJSON(widget.startMsg!));
        });
        _model.chatGPTResponseFirst = await SendFullPromptCall.call(
          apiKey: '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',
          promptJson: _model.chatHistory,
        );
        if ((_model.chatGPTResponseFirst?.succeeded ?? true)) {
          setState(() {
            requested = false;
            stateMsg = "Go ahead, I\'m ready.";
            _model.chatHistory = functions.saveChatHistory(
                _model.chatHistory,
                getJsonField(
                  (_model.chatGPTResponseFirst?.jsonBody ?? ''),
                  r'''$['choices'][0]['message']''',
                ));
          });
        }
        await Future.delayed(const Duration(milliseconds: 800));
      }
      await _model.listViewController?.animateTo(
        _model.listViewController!.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          25.0, 25.0, 25.0, 25.0),
                      child: FlutterFlowIconButton(
                        borderColor: Color(0x80FFFFFF),
                        borderRadius: 50.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: Color(0x4C000000),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('mainScreen');
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Text(
                        'DreamPulse AI Chat Bot',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          25.0, 25.0, 25.0, 25.0),
                      child: FlutterFlowIconButton(
                        borderColor: Color(0x80FFFFFF),
                        borderRadius: 50.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: Color(0x4C000000),
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: Container(
                  width: 370.0,
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Container(
                            width: double.infinity,
                            height: 1.0,
                            decoration: BoxDecoration(
                              color: Color(0x3FFFFFFF),
                              border: Border.all(
                                color: Color(0x40FFFFFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 175.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: Color(0x41FFFFFF),
                              width: 2.0,
                            ),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Text(
                              stateMsg,
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Gilroy',
                                    color: Colors.white,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              requested
                  ? Lottie.network(
                      'https://assets3.lottiefiles.com/packages/lf20_rwq6ciql.json',
                      // width: MediaQuery.of(context).size.width,
                      height: 32.0,
                      fit: BoxFit.cover,
                      animate: true,
                    )
                  : const SizedBox(height: 32),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final chat = _model.chatHistory?.toList() ?? [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: chat.length,
                                itemBuilder: (context, chatIndex) {
                                  final chatItem = chat[chatIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (chatIndex % 2 == 0)
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              if (chatIndex % 2 == 0)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                      maxWidth:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF09CFFC),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                15.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                15.0),
                                                        topRight:
                                                            Radius.circular(
                                                                15.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  12.0,
                                                                  12.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              chatItem,
                                                              r'''$['content']''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        if (chatIndex % 2 == 1)
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                    child: Image.asset(
                                                      'assets/images/Profile_(1).png',
                                                      width: 36.0,
                                                      height: 36.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary30,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 3.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset:
                                                            Offset(0.0, 1.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color: Color(0xFF333337),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12.0,
                                                                12.0,
                                                                12.0,
                                                                12.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SelectionArea(
                                                            child: AutoSizeText(
                                                          getJsonField(
                                                            chatItem,
                                                            r'''$['content']''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 14.0,
                                                                lineHeight: 1.5,
                                                              ),
                                                        )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  );
                                },
                                controller: _model.listViewController,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF2B2B30),
                            borderRadius: BorderRadius.circular(25.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Color(0x80FFFFFF),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                3.0, 3.0, 3.0, 3.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: TextFormField(
                                controller: _model.textController,
                                autofocus: true,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: ' Type your message here...',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00FFFFFF),
                                      width: 5.0,
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      width: 5.0,
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 5.0,
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 5.0,
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFF2B2B30),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                maxLines: 8,
                                minLines: 1,
                                keyboardType: TextInputType.multiline,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Color(0x80FFFFFF),
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: Colors.black,
                        icon: Icon(
                          Icons.settings_voice_outlined,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('voiceChat');
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Color(0x80FFFFFF),
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: Colors.black,
                          icon: Icon(
                            Icons.send_outlined,
                            color: Color(0xFFFDFEFF),
                            size: 24.0,
                          ),
                          showLoadingIndicator: true,
                          onPressed: () async {
                            setState(() {
                              requested = true;
                              stateMsg = "Generating answer...";
                              _model.chatHistory = functions.saveChatHistory(
                                  _model.chatHistory,
                                  functions.convertToJSON(
                                      _model.textController.text));
                            });
                            _model.chatGPTResponse =
                                await SendFullPromptCall.call(
                              apiKey:
                                  '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',
                              promptJson: _model.chatHistory,
                            );
                            if ((_model.chatGPTResponse?.succeeded ?? true)) {
                              setState(() {
                                requested = false;
                                stateMsg = "Go ahead, I\'m ready.";
                                _model.chatHistory = functions.saveChatHistory(
                                    _model.chatHistory,
                                    getJsonField(
                                      (_model.chatGPTResponse?.jsonBody ?? ''),
                                      r'''$['choices'][0]['message']''',
                                    ));
                              });
                              setState(() {
                                _model.textController?.clear();
                              });
                            }
                            await Future.delayed(
                                const Duration(milliseconds: 800));
                            await _model.listViewController?.animateTo(
                              _model
                                  .listViewController!.position.maxScrollExtent,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.ease,
                            );

                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
