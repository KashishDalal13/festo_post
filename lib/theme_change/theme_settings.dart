import 'package:flutter/material.dart';

class ThemeSettings extends ChangeNotifier {
  ThemeData currentTheme = ThemeData.light();

  bool switchValue = false;

  void toggleTheme({required bool switchVal}) {
    switchValue = switchVal;
    notifyListeners();
  }
}
