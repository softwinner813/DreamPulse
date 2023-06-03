import 'dart:io' show Platform;
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

import 'package:flutter_tts/flutter_tts.dart';

Future talkToMe(responseText) async {
  FlutterTts flutterTts = FlutterTts();
  await flutterTts.setLanguage("en-us");
  if (Platform.isIOS) {
    await flutterTts.setSharedInstance(true);
    await flutterTts.setIosAudioCategory(IosTextToSpeechAudioCategory.playback,
        [IosTextToSpeechAudioCategoryOptions.defaultToSpeaker]);
  }
  await flutterTts.speak(responseText);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
