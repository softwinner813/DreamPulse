import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _btnTalk = 'Talk';
  String get btnTalk => _btnTalk;
  set btnTalk(String _value) {
    _btnTalk = _value;
  }

  String _stt = 'Speak...';
  String get stt => _stt;
  set stt(String _value) {
    _stt = _value;
  }

  String _sstSendText = '';
  String get sstSendText => _sstSendText;
  set sstSendText(String _value) {
    _sstSendText = _value;
  }

  String _tts = '';
  String get tts => _tts;
  set tts(String _value) {
    _tts = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
