import 'package:festo_post/utils/string.dart';
import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  int _current = 0,eventIndex=0;
  int get current => _current;


  List<Map<String, dynamic>> addDate = [
    {"label": "14 Oct","imageList":[SvgPath.upcoming1,SvgPath.upcoming2,SvgPath.upcoming3]},
    {"label": "15 Oct","imageList":[SvgPath.upcoming1,SvgPath.upcoming3,SvgPath.upcoming1,SvgPath.upcoming3,SvgPath.upcoming1]},
    {"label": "16 Oct","imageList":[SvgPath.upcoming2,SvgPath.upcoming3]},
    {"label": "17 Oct","imageList":[SvgPath.upcoming1,SvgPath.upcoming2]},
    {"label": "18 Oct","imageList":[SvgPath.upcoming1,SvgPath.upcoming2,SvgPath.upcoming3]},
    {"label": "19 Oct","imageList":[SvgPath.upcoming1,SvgPath.upcoming3]},
  ];

  List<Map<String, dynamic>> addTodayEvent = [
    {"label": StrRef.navratri,"imageList":[SvgPath.navratri1,SvgPath.navratri2,SvgPath.navratri1]},
    {"label": StrRef.coffee,"imageList":[SvgPath.coffee1,SvgPath.coffee2,SvgPath.coffee1]},
    {"label": StrRef.birthday,"imageList":[SvgPath.bday1,SvgPath.bday2,SvgPath.bday1]},
  ];

  onSelectDate({required int index}){
    eventIndex=index;
    notifyListeners();
  }

  void indicator(int index) {
    _current = index;
    notifyListeners();
  }

  void onPageChanged(int index) {
    indicator(index);
  }
}
