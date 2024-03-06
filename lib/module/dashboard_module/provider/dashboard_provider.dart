import 'package:festo_post/utils/string.dart';
import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  int _current = 0,eventIndex=0, trendingIndex = 0;
  int get current => _current;


  List<Map<String, dynamic>> addDate = [
    {"label": "14 Oct","imageList":[SvgPath.upcoming1,SvgPath.upcoming2,SvgPath.upcoming3]},
    {"label": "15 Oct","imageList":["4 Oct","5 Oct","6 Oct"]},
    {"label": "16 Oct","imageList":["7 Oct","8 Oct","9 Oct"]},
    {"label": "17 Oct","imageList":["10 Oct","11 Oct","12 Oct"]},
    {"label": "18 Oct","imageList":["13 Oct","14 Oct","15 Oct"]},
  ];

  List<Map<String, dynamic>> addTodayEvent = [
    {"label": StrRef.navratri,"imageList":[SvgPath.navratri1,SvgPath.navratri2,SvgPath.navratri3]},
    {"label": StrRef.coffee,"imageList":[SvgPath.coffee1,SvgPath.coffee2,SvgPath.coffee3]},
    {"label": StrRef.birthday,"imageList":[SvgPath.bday1,SvgPath.bday2,SvgPath.bday3]},
  ];
  List<Map<String, dynamic>> addTrendingEvent = [
    {"label": "Shramdaan","imageList":[SvgPath.trend1,SvgPath.trend2,SvgPath.trend3,SvgPath.trend4]},
    {"label": "Sports","imageList":[SvgPath.coffee1,SvgPath.coffee2,SvgPath.coffee3]},
    {"label": "Gold Medal","imageList":[SvgPath.bday1,SvgPath.bday2,SvgPath.bday3]},
    {"label": "Politics","imageList":[SvgPath.bday1,SvgPath.bday2,SvgPath.bday3]},
  ];
  List<Map<String, dynamic>> addSeasonOffers = [
    {"imageList":SvgPath.festiveOffer1,"label": "Navratri Offer"},
    {"imageList":SvgPath.festiveOffer2,"label": "Dussehra Offers"},
    {"imageList":SvgPath.festiveOffer3,"label": "Diwali Sale & Offers"},
    {"imageList":SvgPath.festiveOffer4,"label": "All Offers"}
  ];

  onSelectDate({required int index}){
    eventIndex=index;
    notifyListeners();
  }

  onSelectTrending({required int index}){
    trendingIndex=index;
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
