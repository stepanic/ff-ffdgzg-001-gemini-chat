import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _systemMessage =
      'You are a comedian that tells jokes about computer science.';
  String get systemMessage => _systemMessage;
  set systemMessage(String value) {
    _systemMessage = value;
  }

  String _prompt = '';
  String get prompt => _prompt;
  set prompt(String value) {
    _prompt = value;
  }

  List<MessageStruct> _chat = [];
  List<MessageStruct> get chat => _chat;
  set chat(List<MessageStruct> value) {
    _chat = value;
  }

  void addToChat(MessageStruct value) {
    chat.add(value);
  }

  void removeFromChat(MessageStruct value) {
    chat.remove(value);
  }

  void removeAtIndexFromChat(int index) {
    chat.removeAt(index);
  }

  void updateChatAtIndex(
    int index,
    MessageStruct Function(MessageStruct) updateFn,
  ) {
    chat[index] = updateFn(_chat[index]);
  }

  void insertAtIndexInChat(int index, MessageStruct value) {
    chat.insert(index, value);
  }

  String _geminiApiKey = 'API_Key';
  String get geminiApiKey => _geminiApiKey;
  set geminiApiKey(String value) {
    _geminiApiKey = value;
  }
}
