import 'dart:async';
import 'package:festo_post/utils/string.dart';
import 'package:festo_post/widget/toast.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  int introIndex = 0;
  double process = 0.33;
  Duration? timer;
  final pageController = PageController();
  Duration timerDuration = const Duration(seconds: 50);
  late Timer _timer;
  int selected = 0;
  TextEditingController brandName = TextEditingController(),
      brandMob = TextEditingController(),
      brandEmail = TextEditingController(),
      brandWeb = TextEditingController(),
      brandAdd = TextEditingController();

  bool timerActive = false,
      toggleWhatsAppOrSms = false,
      toggleLoginOrRegister = false;
  TextEditingController phoneController = TextEditingController(),
      otpController = TextEditingController();

  // payal
    List<Map<String, dynamic>> addDetail = [
      {"svg": SvgPath.tag, "label": StrRef.brandName, "controller": TextEditingController()},
      {"svg": SvgPath.suitcase, "label": StrRef.brandCat, "controller": TextEditingController()},
      {"svg": SvgPath.phone, "label": StrRef.contact, "controller""": TextEditingController()},
      {"svg": SvgPath.email, "label": StrRef.email, "controller": TextEditingController()},
      {"svg": SvgPath.web, "label": StrRef.website, "controller": TextEditingController()},
      {"svg": SvgPath.location, "label": StrRef.businessAddress, "controller": TextEditingController()},
    ];


  //Roshni
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
    } else {
      introIndex--;
    }
    notifyListeners();
  }

  onIndexChange({required int index}) {
    introIndex = index;
    notifyListeners();
  }

  void onOtpVerify() {
    if (otpController.value.text.isEmpty) {
      Toast.toast(msg: "Please enter OTP number");
    } else if (otpController.value.text.length < 4) {
      Toast.toast(msg: "Please enter valid Otp number");
    } else {
      introIndex = 2;
      _timer.cancel();
    }
    notifyListeners();
  }

  onSkipOrSubmit() {
    introIndex = 3;
    notifyListeners();
  }

  void onOTPsuccess() {
    // debugPrint("$introIndex");
    introIndex = 3;
    notifyListeners();
  }
}
