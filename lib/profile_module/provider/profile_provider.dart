import 'package:flutter/material.dart';

import '../../utils/routes.dart';
import '../../utils/string.dart';

class ProfileProvider extends ChangeNotifier{

  List<Map<String, dynamic>> profileDetails = [
    {"icon": SvgPath.profile, "label": StrRef.accountDetails, "route": ''},
    {"icon": SvgPath.savePost, "label": StrRef.savePost, "route": ''},
    {"icon": SvgPath.tag, "label": StrRef.brandSubscript, "route": ''},
    {"icon": SvgPath.rewardPoints, "label": StrRef.rewardPoints, "route": ''},
    {"icon": SvgPath.transaction, "label": StrRef.transaction, "route": ''},
    {"icon": SvgPath.logout, "label": StrRef.logout, "route": ''},

  ];

  onBack() {
    NavigationService.replaceToNamed('dashboard');
  }

}