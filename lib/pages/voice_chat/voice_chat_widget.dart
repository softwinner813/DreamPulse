import 'dart:io' show Platform;
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'voice_chat_model.dart';
export 'voice_chat_model.dart';

class VoiceChatWidget extends StatefulWidget {
  const VoiceChatWidget({
    Key? key,
    this.chatUser,
    this.chatRef,
  }) : super(key: key);

  final UsersRecord? chatUser;
  final DocumentReference? chatRef;

  @override
  _VoiceChatWidgetState createState() => _VoiceChatWidgetState();
}

class _VoiceChatWidgetState extends State<VoiceChatWidget> {
  late VoiceChatModel _model;
  bool recording = false;
  bool apiState = false;
  stt.SpeechToText speech = stt.SpeechToText();
  String sttText = "";
  String recorderState = "Not listening now.";
  String ttsValue = "";
  FlutterTts flutterTts = FlutterTts();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    initSpeech();
    initVoice();
    _model = createModel(context, () => VoiceChatModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  void initSpeech() async {
    final isAvailable = await speech.initialize();
    if (isAvailable) print("Available Device");
  }

  void initVoice() async {
    await flutterTts.setLanguage("en-us");
    if (Platform.isIOS) {
      await flutterTts.setSharedInstance(true);
      await flutterTts.setIosAudioCategory(
          IosTextToSpeechAudioCategory.playback,
          [IosTextToSpeechAudioCategoryOptions.defaultToSpeaker]);
    }
  }

  void startListening() {
    speech.listen(onResult: (result) {
      print("In onResult");
      setState(() {
        recorderState = "Go ahead, I’m listening. To stop, press mic again.";
      });
      if (result.finalResult) {
        setState(() {
          sttText = "Q:" + result.recognizedWords;
        });
      }
    });
  }

  void stopListening() {
    setState(() {
      recorderState = "Press mic to begin.";
    });
    speech.stop();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 25.0),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 25.0),
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
            if (!recording && !apiState)
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
                              "Press mic to begin",
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
            // Text(
            //   "Press mic to begin",
            //   style: TextStyle(color: Colors.white),
            // ),
            if (recording && !apiState)
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
                          width: 220.0,
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
                              "Go ahead, I’m listening...",
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
            // Text(
            //   "Go ahead, I’m listening...",
            //   style: TextStyle(color: Colors.white),
            // ),
            if (apiState && !recording)
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
                              "Generating answer...",
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
            // Text(
            //   "Generating answer...",
            //   style: TextStyle(color: Colors.white),
            // ),
            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
            //   child: Container(
            //     width: 370.0,
            //     child: Stack(
            //       alignment: AlignmentDirectional(0.0, 0.0),
            //       children: [
            //         Align(
            //           alignment: AlignmentDirectional(0.0, 0.0),
            //           child: Padding(
            //             padding: EdgeInsetsDirectional.fromSTEB(
            //                 0.0, 12.0, 0.0, 12.0),
            //             child: Container(
            //               width: double.infinity,
            //               height: 1.0,
            //               decoration: BoxDecoration(
            //                 color: Color(0x3FFFFFFF),
            //                 border: Border.all(
            //                   color: Color(0x40FFFFFF),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Align(
            //           alignment: AlignmentDirectional(0.0, 0.0),
            //           child: Container(
            //             width: 175.0,
            //             height: 32.0,
            //             decoration: BoxDecoration(
            //               color: Colors.black,
            //               borderRadius: BorderRadius.circular(20.0),
            //               border: Border.all(
            //                 color: Color(0x41FFFFFF),
            //                 width: 2.0,
            //               ),
            //             ),
            //             alignment: AlignmentDirectional(0.0, 0.0),
            //             child: Padding(
            //               padding: EdgeInsetsDirectional.fromSTEB(
            //                   10.0, 0.0, 10.0, 0.0),
            //               child: Text(
            //                 'Go ahead, I\'m ready.',
            //                 style: FlutterFlowTheme.of(context)
            //                     .labelMedium
            //                     .override(
            //                       fontFamily: 'Gilroy',
            //                       color: Colors.white,
            //                       useGoogleFonts: false,
            //                     ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 25.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                      child: Lottie.network(
                        'https://assets7.lottiefiles.com/packages/lf20_6IDBrn2S0u.json',
                        width: 200.0,
                        height: 100.0,
                        fit: BoxFit.contain,
                        animate: recording,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              // Padding(
                              //   padding: EdgeInsetsDirectional.fromSTEB(
                              //       0.0, 12.0, 0.0, 0.0),
                              //   child: Text(
                              //     recorderState,
                              //     style: FlutterFlowTheme.of(context)
                              //         .titleLarge
                              //         .override(
                              //           fontFamily: 'Outfit',
                              //           color: Colors.white,
                              //         ),
                              //   ),
                              // ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  sttText,
                                  textAlign: TextAlign.left,
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontSize: 24,
                                        fontFamily: 'Outfit',
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromARGB(255, 106, 208, 255),
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  ttsValue,
                                  textAlign: TextAlign.left,
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontSize: 20,
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ],
                          ),
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
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
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
                          context.safePop();
                        },
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // !recording && !apiState
                          // recording && !apiState
                          // apiState && !recording
                          if (!recording && !apiState)
                            Container(
                              width: 150.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  print("Begin");
                                  await flutterTts.stop();
                                  if (!recording) {
                                    var available = await speech.initialize(
                                      onStatus: (status) =>
                                          print('onStatus: $status'),
                                      onError: (error) =>
                                          print('onError: $error'),
                                    );
                                    if (available) {
                                      setState(() {
                                        recording = true;
                                        ttsValue = "";
                                        speech.listen(onResult: (result) {
                                          sttText =
                                              "Q: " + result.recognizedWords;
                                        });
                                      });
                                    }
                                  }
                                },
                                child: Lottie.network(
                                  'https://assets5.lottiefiles.com/packages/lf20_l8la4vrlSt.json',
                                  width: 150.0,
                                  height: 130.0,
                                  fit: BoxFit.cover,
                                  animate: true,
                                ),
                              ),
                            ),
                          if (recording && !apiState)
                            Container(
                              width: 150.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  print("Stop");
                                  stopListening();
                                  setState(() {
                                    recording = false;
                                    apiState = true;
                                  });
                                  if (sttText != "") {
                                    _model.chatGPTVoiceResponse =
                                        await VoiceChatCall.call(
                                      apiKey:
                                          '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',
                                      message: sttText,
                                    );
                                    if ((_model
                                            .chatGPTVoiceResponse?.succeeded ??
                                        true)) {
                                      String responseText = getJsonField(
                                        (_model.chatGPTVoiceResponse
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.choices[0].message.content''',
                                      ).toString();
                                      setState(() {
                                        ttsValue = "A: " + responseText;
                                        apiState = false;
                                      });
                                      await flutterTts.speak(responseText);
                                    }
                                  }

                                  // setState(() {});
                                },
                                child: Lottie.network(
                                  'https://assets5.lottiefiles.com/packages/lf20_YWXN67wWtj.json',
                                  width: 150.0,
                                  height: 130.0,
                                  fit: BoxFit.cover,
                                  animate: true,
                                ),
                              ),
                            ),
                          if (apiState && !recording)
                            Container(
                              width: 150.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  print("Generating answers...");
                                },
                                child: Lottie.network(
                                  'https://assets3.lottiefiles.com/packages/lf20_pekacwmz.json',
                                  width: 150.0,
                                  height: 130.0,
                                  fit: BoxFit.cover,
                                  animate: true,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          25.0, 25.0, 25.0, 25.0),
                      child: FlutterFlowIconButton(
                        borderColor: Color(0x80FFFFFF),
                        borderRadius: 50.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: Color(0x4C000000),
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('mainScreen');
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
    );
  }
}
