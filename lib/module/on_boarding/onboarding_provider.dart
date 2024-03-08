import 'package:festo_post/utils/routes.dart';
import 'package:flutter/material.dart';
import '../../shared/injector.dart';
import 'on_boarding_info.dart';
import 'package:festo_post/utils/string.dart';

class IntroProvider extends ChangeNotifier {
  int introIndex = 0;
  double process = 0.33;
  Duration? timer;
  final pageController = PageController();
  bool switchValue = false;

  IntroProvider() {
    loadTheme();
    if (Injector.getOnBoarding() == true) {
      NavigationService.replaceToNamed('register');
    }
  }

  loadTheme() async {
    switchValue = await Injector.getTheme();
    notifyListeners();
  }

  void toggleTheme({required bool switchVal}) async {
    switchValue = switchVal;
    Injector.setTheme(themeVal: switchValue);
    debugPrint("$switchValue");
    // Injector.getTheme();
    notifyListeners();
  }

  void getStarted() {
    Injector.setOnBoarding();
    NavigationService.replaceToNamed('register');
  }

  List<OnBoardingInfo> items = [
    OnBoardingInfo(title: StrRef.onBoardTitle1, descriptions: StrRef.onBoardDesc1, image: SvgPath.onBoardImg1),
    OnBoardingInfo(title: StrRef.onBoardTitle2, descriptions: StrRef.onBoardDesc2, image: SvgPath.onBoardImg2),
    OnBoardingInfo(title: StrRef.onBoardTitle3, descriptions: StrRef.onBoardDesc3, image: SvgPath.onBoardImg3),
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
    if (introIndex == 2) {
      return;
      //implement logic for navigating to next screen
    }
    pageController.jumpToPage(items.length - 1);
    notifyListeners();
  }
}
