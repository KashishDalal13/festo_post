import 'package:festo_post/app_export.dart';

class Injector {
  static late SharedPreferences prefs;

  Injector() {
    getInstance().then((value) {
      getTheme();
    });
  }

  static getRoute() {
    if (Injector.getSignIn() == true) {
      NavigationService.replaceToNamed('dashboard');
    } else {
      if (Injector.getOnBoarding() == true) {
        NavigationService.replaceToNamed('register');
      } else {
        NavigationService.replaceToNamed('onboarding');
      }
    }
  }

  Future<void> getInstance() async {
    prefs = await SharedPreferences.getInstance();
    debugPrint("Shared Preferences Initialized..");
  }

  static void setTheme({required bool themeVal}) {
    debugPrint("theme changed $themeVal");
    prefs.setBool(PrefsKey.theme, themeVal);
  }

  static getTheme() async {
    prefs = await SharedPreferences.getInstance();
    debugPrint("getTheme${prefs.getBool(PrefsKey.theme)}");
    return prefs.getBool(PrefsKey.theme) ?? false;
  }

  static setOnBoarding() {
    prefs.setBool(PrefsKey.onBoarding, true);
  }

  static bool getOnBoarding() {
    return prefs.getBool(PrefsKey.onBoarding) ?? false;
  }

  static setSignIn() {
    prefs.setBool(PrefsKey.signIn, true);
  }

  static bool getSignIn() {
    return prefs.getBool(PrefsKey.signIn) ?? false;
  }
}
