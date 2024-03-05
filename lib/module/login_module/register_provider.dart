import 'dart:async';
import 'package:festo_post/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:festo_post/module/login_module/register_info.dart';
import 'package:festo_post/utils/string.dart';

class RegisterProvider extends ChangeNotifier {
  int introIndex = 0;
  double process = 0.33;
  Duration? timer;
  final pageController = PageController();
  Duration timerDuration = const Duration(seconds: 50);
  late Timer _timer;

  bool timerActive = false, toggleWhatsAppOrSms = false, toggleLoginOrRegister = false;
  TextEditingController phoneController = TextEditingController();

  List<RegisterInfo> items = [
    RegisterInfo(title: StrRef.registerTitle1, title2: StrRef.registerTitle2, image: SvgPath.registerImg1, descriptions: StrRef.register),
    RegisterInfo(title: StrRef.registerTitle1, title2: StrRef.registerTitle2, image: SvgPath.loginImg1, descriptions: StrRef.login),
    RegisterInfo(title: "", title2: StrRef.otpTitle, image: SvgPath.otpImg, descriptions: StrRef.resendOtp),
    RegisterInfo(title: "", title2: "", image: SvgPath.otpSuccess, descriptions: StrRef.verified + " " + StrRef.success),
  ];

  //Roshni
  void onVerify() {
    if (phoneController.text.isEmpty) {
      Toast.toast(msg: "Please enter mobile number");
    } else if (phoneController.text.length < 10) {
      debugPrint("${phoneController.text.length}");
      Toast.toast(msg: "Mobile number must be 10 digits long");
    } else {
      introIndex = 1;
      startTimer();
    }
    notifyListeners();
  }

  //Roshni
  onToggleLoginOrRegister() {
    toggleLoginOrRegister = !toggleLoginOrRegister;
    notifyListeners();
  }

  //Roshni
  void onBack() {
    if (introIndex == 1) {
      introIndex = 0;
      _timer.cancel();
    }
    notifyListeners();
  }

  void startTimer() {
    timerDuration = const Duration(seconds: 50);
    if (timerDuration != Duration.zero) {
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        final seconds = (timerDuration.inSeconds - 1);
        if (timerDuration.inSeconds <= 0) {
          _timer.cancel();
          notifyListeners();
          timerDuration = Duration.zero;
        } else {
          timerDuration = Duration(seconds: seconds);
        }
        notifyListeners();
      });
    }
  }

  onIndexChange({required int index}) {
    introIndex = index;
    notifyListeners();
  }
}
