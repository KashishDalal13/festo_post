import 'dart:async';

import 'package:festo_post/shared/injector.dart';
import 'package:flutter/material.dart';

class SplashViewProvider extends ChangeNotifier {
  SplashViewProvider() {
    debugPrint("Splash");
    Timer(const Duration(seconds: 3), () {
      Injector.getTheme();
      Injector.getRoute();
    });
  }
}
