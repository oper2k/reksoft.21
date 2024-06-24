import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

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
      _isDarkTheme = prefs.getBool('ff_isDarkTheme') ?? _isDarkTheme;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_chatHistory')) {
        try {
          _chatHistory = jsonDecode(prefs.getString('ff_chatHistory') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _chatMessage = prefs.getInt('ff_chatMessage') ?? _chatMessage;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _selectedNewsCategory = '';
  String get selectedNewsCategory => _selectedNewsCategory;
  set selectedNewsCategory(String value) {
    _selectedNewsCategory = value;
  }

  String _employmentTypeFilter = '';
  String get employmentTypeFilter => _employmentTypeFilter;
  set employmentTypeFilter(String value) {
    _employmentTypeFilter = value;
  }

  String _workFormatFilter = '';
  String get workFormatFilter => _workFormatFilter;
  set workFormatFilter(String value) {
    _workFormatFilter = value;
  }

  String _specializationFilter = '';
  String get specializationFilter => _specializationFilter;
  set specializationFilter(String value) {
    _specializationFilter = value;
  }

  int _salaryFilter = 0;
  int get salaryFilter => _salaryFilter;
  set salaryFilter(int value) {
    _salaryFilter = value;
  }

  String _keywordsFilter = '';
  String get keywordsFilter => _keywordsFilter;
  set keywordsFilter(String value) {
    _keywordsFilter = value;
  }

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;
  set isDarkTheme(bool value) {
    _isDarkTheme = value;
    prefs.setBool('ff_isDarkTheme', value);
  }

  bool _isResumeUploaded = false;
  bool get isResumeUploaded => _isResumeUploaded;
  set isResumeUploaded(bool value) {
    _isResumeUploaded = value;
  }

  dynamic _chatHistory = jsonDecode('null');
  dynamic get chatHistory => _chatHistory;
  set chatHistory(dynamic value) {
    _chatHistory = value;
    prefs.setString('ff_chatHistory', jsonEncode(value));
  }

  int _chatMessage = 0;
  int get chatMessage => _chatMessage;
  set chatMessage(int value) {
    _chatMessage = value;
    prefs.setInt('ff_chatMessage', value);
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
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
