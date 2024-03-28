import 'package:festo_post/app_export.dart';

class SplashViewProvider extends ChangeNotifier {
  SplashViewProvider() {
    debugPrint("Splash");
    Timer(const Duration(seconds: 3), () {
      Injector.getTheme();
      Injector.getRoute();
    });
  }
}
