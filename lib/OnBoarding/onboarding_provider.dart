import 'package:flutter/material.dart';

import 'on_BoardingItems.dart';

class IntroProvider extends ChangeNotifier {
  int introIndex = 0;
  double process = 0.33;
  Duration? timer;
  final controller = OnBoardingItems();
  final pageController = PageController();

  void onNext() {
    pageController.nextPage(
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
    notifyListeners();
  }
}
