import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _authorName = prefs.getString('ff_authorName') ?? _authorName;
    });
    _safeInit(() {
      _quoteText = prefs.getString('ff_quoteText') ?? _quoteText;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _authorName = 'authorName';
  String get authorName => _authorName;
  set authorName(String value) {
    _authorName = value;
    prefs.setString('ff_authorName', value);
  }

  String _quoteText = '';
  String get quoteText => _quoteText;
  set quoteText(String value) {
    _quoteText = value;
    prefs.setString('ff_quoteText', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
