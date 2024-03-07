import 'package:flutter/material.dart';

import '../../../utils/string.dart';

class SettingProvider extends ChangeNotifier{

  List<Map<String, dynamic>> settingDetails = [
    {"icon": SvgPath.profile, "label": StrRef.myAccount, "route": ''},
    {"icon": SvgPath.contactUs, "label": StrRef.contactUs, "route": ''},
    {"icon": SvgPath.aboutUs, "label": StrRef.aboutUs, "route": ''},
    {"icon": SvgPath.faq, "label": StrRef.faq, "route": ''},
    {"icon": SvgPath.theme, "label": StrRef.darkTheme, "route": ''},
    {"icon": SvgPath.logout, "label": StrRef.logout, "route": ''},
  ];


  void onBack(BuildContext context) {
    Navigator.pushReplacementNamed(context, 'dashboard');
    notifyListeners();
  }

}
