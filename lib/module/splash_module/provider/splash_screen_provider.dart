import 'package:festo_post/app_export.dart';

class SplashViewProvider extends ChangeNotifier {
  SplashViewProvider() {
    debugPrint("Splash");
    Injector.getTheme();
    Timer(const Duration(seconds: 3), () {
      Injector.getRoute();
    });
  }
}
