import 'package:festo_post/module/login_module/register_info.dart';
import 'package:flutter/material.dart';
import 'package:festo_post/utils/string.dart';

class RegisterProvider extends ChangeNotifier{
  int introIndex = 0;
  double process = 0.33;
  Duration? timer;
  final pageController = PageController();

  List<RegisterInfo> items = [
    RegisterInfo(title: StrRef.registerTitle1,title2: StrRef.registerTitle2, image: SvgPath.registerImg1,descriptions: StrRef.register),
    RegisterInfo(title: StrRef.registerTitle1,title2: StrRef.registerTitle2, image: SvgPath.loginImg1, descriptions: StrRef.login),
  ];

  onIndexChange({required int index}) {
    introIndex = index;
    notifyListeners();
  }
}