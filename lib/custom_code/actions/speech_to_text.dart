// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:logger/logger.dart';

Future speechToText() async {
  print(4);
  String output = '';
  print(5);
  bool _onDevice = false;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String _currentLocaleId = '';
  print(6);
  final SpeechToText speech = SpeechToText();
  print(7);

  Logger().d(speech);
  bool isInitialized = await speech.initialize();
  Logger().d("isInitialized");
  Logger().d(isInitialized);

  if (isInitialized) {
    var systemLocale = await speech.systemLocale();
    _currentLocaleId = systemLocale?.localeId ?? '';
    Logger().d("_currentLocaleId");
    Logger().d(_currentLocaleId);
    try {
      final result = await speech.listen(
        onResult: (result1) {
          Logger().d("result1.finalResult1");
          Logger().d(result1);
          if (!result1.finalResult) {
            FFAppState().update(() {
              FFAppState().btnTalk = 'listening...';
              FFAppState().stt = '${result1.recognizedWords}';
            });
          } else {
            FFAppState().update(() {
              output = '${result1.recognizedWords}';
              FFAppState().sstSendText = '${result1.recognizedWords}';
              FFAppState().btnTalk = 'Talk';
            });
          }
        },
        listenFor: Duration(seconds: 10),
        pauseFor: Duration(seconds: 3),
        partialResults: true,
        localeId: _currentLocaleId,
        onSoundLevelChange: (level) {
          minSoundLevel = min(minSoundLevel, level);
          maxSoundLevel = max(maxSoundLevel, level);
          print('sound level $level: $minSoundLevel - $maxSoundLevel ');
          level = level;
        },
        cancelOnError: true,
        listenMode: ListenMode.confirmation,
        onDevice: _onDevice,
      );

      Logger().d(result);
    } catch (error) {
      Logger().e(error);
    }
  } else {
    print("The user has denied the use of speech recognition.");
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
