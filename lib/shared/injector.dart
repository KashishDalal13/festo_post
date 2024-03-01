import 'package:festo_post/shared/prefs_key.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Injector {
  static late SharedPreferences prefs;

  Injector() {
    getInstance().then((value) => getTheme());
  }

  Future<void> getInstance() async {
    prefs = await SharedPreferences.getInstance();
    debugPrint("Shared Preferences Initialized..");
  }

  static void setTheme({required bool themeVal}) {
    prefs.setBool(PrefsKey.theme, themeVal);
    debugPrint("set ${PrefsKey.theme}=>$themeVal");
  }

  static getTheme() async {
    debugPrint("get ${PrefsKey.theme}=>${prefs.getBool(PrefsKey.theme)}");
    prefs = await SharedPreferences.getInstance();
    return prefs.getBool(PrefsKey.theme) ?? false;
  }
}
