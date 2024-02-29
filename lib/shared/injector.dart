import 'package:festo_post/shared/prefs_key.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Injector {
  static late SharedPreferences prefs;

  Injector() {
    getInstance();
  }

  Future<void> getInstance() async {
    prefs = await SharedPreferences.getInstance();
    debugPrint("Shared Preferences Initialized..");
  }

  static void setTheme({required bool themeVal}) => prefs.setBool(PrefsKey.theme,themeVal);

  static bool getTheme() => prefs.getBool(PrefsKey.theme) ?? false;
}