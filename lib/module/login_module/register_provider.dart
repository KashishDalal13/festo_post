import 'package:festo_post/module/login_module/register_info.dart';
import 'package:flutter/material.dart';
import 'package:festo_post/utils/string.dart';

class RegisterProvider extends ChangeNotifier {
  int introIndex = 0;
  double process = 0.33;
  Duration? timer;
  final pageController = PageController();

  List<RegisterInfo> items = [
    RegisterInfo(
        title: StrRef.registerTitle1,
        title2: StrRef.registerTitle2,
        image: SvgPath.registerImg1,
        descriptions: StrRef.register),
    RegisterInfo(
        title: StrRef.registerTitle1,
        title2: StrRef.registerTitle2,
        image: SvgPath.loginImg1,
        descriptions: StrRef.login),
    RegisterInfo(
        title: "",
        title2: StrRef.otpTitle,
        image: SvgPath.otpImg,
        descriptions: StrRef.resendOtp),
    RegisterInfo(
        title: "",
        title2: "",
        image: SvgPath.otpSuccess,
        descriptions: StrRef.verified+" "+StrRef.success),
    RegisterInfo(
        title: "",
        title2: StrRef.referralTittle+" "+StrRef.reward,
        image: SvgPath.referral,
        descriptions: ""),
  ];

  void onLogin() {
    debugPrint("$introIndex");
    introIndex = 1;
    notifyListeners();
  }

  void onCreateAccount() {
    // debugPrint("$introIndex");
    introIndex = 0;
    notifyListeners();
  }
  void onOTP() {
    // debugPrint("$introIndex");
    introIndex = 2;
    notifyListeners();
  }

  void onOTPsuccess(){
    // debugPrint("$introIndex");
    introIndex = 3;
    notifyListeners();
  }

  onIndexChange({required int index}) {
    introIndex = index;
    notifyListeners();
  }
}
