import 'package:flutter/material.dart';
import 'on_boarding_info.dart';

class IntroProvider extends ChangeNotifier {
  int introIndex = 0;
  double process = 0.33;
  Duration? timer;
  final pageController = PageController();

  List<OnBoardingInfo> items = [
    OnBoardingInfo(title: "Welcome to Festopost", descriptions: "Celebrate Festivals and Boost Your Business with Our Posts and Offers.", image: "assets/svg/onboard1.svg"),
    OnBoardingInfo(title: "Simplified Post Creation", descriptions: "Connect with your customers on every holiday with creative posts.", image: "assets/svg/onboard2.svg"),
    OnBoardingInfo(title: "Download and Share", descriptions: "Easy to Download and Share Posts on Social Media", image: "assets/svg/onboard3.svg"),
  ];

  void onNext() {
    if (introIndex == 2) {
      return;
      //implement logic for navigating to next screen
    }
    introIndex++;
    pageController.animateToPage(introIndex, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    notifyListeners();
  }

  onIndexChange({required int index}) {
    introIndex = index;
    notifyListeners();
  }

  void onSkip() {
    pageController.jumpToPage(items.length - 1);
    notifyListeners();
  }
}
