import 'package:festo_post/shared/injector.dart';
import 'package:festo_post/utils/bool.dart';
import 'package:festo_post/utils/colors.dart';
import 'package:flutter/material.dart';

class ThemeSettings extends ChangeNotifier {
  ThemeSettings() {
    loadTheme();
  }

  loadTheme() async {
    BoolRef.themeChange = await Injector.getTheme();
    if (BoolRef.themeChange == true) {
      ColorRef.commonBgColor = ColorRef.grey4E6B86;
    }else{
      ColorRef.commonBgColor = ColorRef.greyEDEDED;
    }
    notifyListeners();
  }

  void toggleTheme({required bool switchVal}) async {
    BoolRef.themeChange = switchVal;
    Injector.setTheme(themeVal: BoolRef.themeChange);
    if (BoolRef.themeChange == true) {
      ColorRef.commonBgColor = ColorRef.grey4E6B86;
    }else{
      ColorRef.commonBgColor = ColorRef.greyEDEDED;
    }
    debugPrint("${ColorRef.commonBgColor}");
    // Injector.getTheme();
    notifyListeners();
  }
}
