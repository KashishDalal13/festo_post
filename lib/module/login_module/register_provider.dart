import 'dart:async';
import 'package:flutter/material.dart';
import 'package:festo_post/module/login_module/register_info.dart';
import 'package:festo_post/utils/string.dart';

class RegisterProvider extends ChangeNotifier {
  int introIndex = 0;
  double process = 0.33;
  Duration? timer;
  final pageController = PageController();
  int _timerDuration = 50; // Initial timer duration in seconds
  late Timer _timer;
  bool _timerActive = false;

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
        descriptions: StrRef.verified + " " + StrRef.success),
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

  void onOTP(String mobileNumber) {
    // debugPrint("$introIndex");
    introIndex = 2;
    print('Mobile Number: $mobileNumber');
    startTimer(); // Start the timer when OTP screen is shown
    notifyListeners();
  }


  void onOTPsuccess() {
    // debugPrint("$introIndex");
    introIndex = 3;
    notifyListeners();
  }

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (_timerDuration > 0) {
          _timerDuration--;
          _timerActive = true; // Set timer as active
          notifyListeners(); // Notify listeners to update the UI with the new timer value
        } else {
          _timerActive = false;
          _timer.cancel(); // Cancel the timer when it reaches 0
        }
      },
    );
  }


  // This method resets the timer to the initial value
  void resetTimer() {
    _timerDuration = 50;
    notifyListeners();
  }

  // This method returns the current timer value
  int getTimerDuration() {
    return _timerDuration;
  }

  // This method returns whether the timer is active or not
  bool isTimerActive() {
    return _timerActive;
  }

  onIndexChange({required int index}) {
    introIndex = index;
    notifyListeners();
  }
}
