import 'package:flutter/material.dart';

class Messages extends ChangeNotifier {
  String encryptedText = "";
  String decryptedText = "";
  void addToEncrypt(e) {
    encryptedText += e;
    notifyListeners();
  }

  void resetEncrypt() {
    encryptedText = "";
    notifyListeners();
  }

  void addToDecrypt(e) {
    decryptedText += e;
    notifyListeners();
  }

  void resetDecrypt() {
    decryptedText = "";
    notifyListeners();
  }
}
