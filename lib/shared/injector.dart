import 'package:festo_post/shared/prefs_key.dart';
import 'package:festo_post/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Injector {
  static late SharedPreferences prefs;

  Injector() {
    getInstance().then((value) {
      getTheme();
      getRoute();
    });
  }

  getRoute() {
    if (Injector.getOnBoarding() == true) {
      if (Injector.getSignIn() == false) {
        StringRef.initialRoute = 'register';
      } else {
        StringRef.initialRoute = 'dashboard';
      }
    }
    debugPrint(StringRef.initialRoute);
  }

  Future<void> getInstance() async {
    prefs = await SharedPreferences.getInstance();
    debugPrint("Shared Preferences Initialized..");
  }

  static void setTheme({required bool themeVal}) {
    prefs.setBool(PrefsKey.theme, themeVal);
  }

  static getTheme() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getBool(PrefsKey.theme) ?? false;
  }

  static setOnBoarding() {
    prefs.setBool(PrefsKey.onBoarding, true);
  }

  static bool getOnBoarding() {
    return prefs.getBool(PrefsKey.onBoarding) ?? false;
  }

  static setSignIn() {
    prefs.setBool(PrefsKey.signIn, true);
  }

  static bool getSignIn() {
    return prefs.getBool(PrefsKey.signIn) ?? false;
  }
}
