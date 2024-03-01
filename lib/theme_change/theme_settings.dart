import 'package:festo_post/shared/injector.dart';
import 'package:flutter/material.dart';

class ThemeSettings extends ChangeNotifier {
  ThemeSettings() {
    // switchValue = Injector.getTheme();
  }

  ThemeData currentTheme = ThemeData.light();
  bool switchValue = false;

  void toggleTheme({required bool switchVal}) async {
    switchValue = switchVal;
    // Injector.setTheme(themeVal: switchValue);
    // Injector.getTheme();
    notifyListeners();
  }
}
