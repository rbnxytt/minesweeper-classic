import 'dart:async';
import 'package:flutter/material.dart';

class TimeController extends ChangeNotifier {
  int _second = 0;
  bool _isRunning = false;
  int get second => _second;
  bool get isRunning => _isRunning;

  final Duration _time = const Duration(seconds: 1);

  void resetTimer() {
    if (!_isRunning) _second = 0;
    notifyListeners();
  }

  void timer() {
    _isRunning = !_isRunning;
    Timer.periodic(_time, (timer) {
      _isRunning
          ? _second < 999
              ? _second++
              : _second += 0
          : timer.cancel();
    });
    notifyListeners();
  }
}
