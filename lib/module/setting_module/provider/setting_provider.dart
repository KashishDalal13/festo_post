import 'package:flutter/material.dart';

import '../../../shared/injector.dart';
import '../../../utils/routes.dart';
import '../../../utils/string.dart';

class SettingProvider extends ChangeNotifier{
  bool switchValue = false;
  List<Map<String, dynamic>> settingDetails = [
    {"icon": SvgPath.profile, "label": StrRef.myAccount, "route": ''},
    {"icon": SvgPath.contactUs, "label": StrRef.contactUs, "route": ''},
    {"icon": SvgPath.aboutUs, "label": StrRef.aboutUs, "route": ''},
    {"icon": SvgPath.faq, "label": StrRef.faq, "route": ''},
    {"icon": SvgPath.theme, "label": StrRef.darkTheme, "route": ''},
    {"icon": SvgPath.logout, "label": StrRef.logout, "route": ''},
  ];

  loadTheme() async {
    switchValue = await Injector.getTheme();
    if (Injector.getOnBoarding() == true) {
      if (Injector.getSignIn() == false) {
        NavigationService.replaceToNamed('register');
      } else {
        NavigationService.replaceToNamed('dashboard');
      }
    }
    notifyListeners();
  }

  void toggleTheme({required bool switchVal}) async {
    switchValue = switchVal;
    Injector.setTheme(themeVal: switchValue);
    // debugPrint("$switchValue");
    Injector.getTheme();
    notifyListeners();
  }
  void onBack() {
    NavigationService.replaceToNamed('dashboard');
    notifyListeners();
  }

}
