import 'package:flutter/material.dart';

class KeyError extends ChangeNotifier {
  bool _error = false;
  bool get error => _error;
  void setError(bool e) {
    _error = e;
    notifyListeners();
  }
}
