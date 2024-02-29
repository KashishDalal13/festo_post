import 'package:festo_post/shared/injector.dart';
import 'package:flutter/material.dart';

class ThemeSettings extends ChangeNotifier {
  ThemeData currentTheme = ThemeData.light();
  bool switchValue = false;

  ThemeSettings() {
    switchValue = Injector.getTheme();
  }

  void toggleTheme({required bool switchVal}) async {
    switchValue = switchVal;
    Injector.setTheme(themeVal: switchValue);
    notifyListeners();
  }
}
