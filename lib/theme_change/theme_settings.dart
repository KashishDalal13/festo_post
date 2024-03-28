import 'package:festo_post/app_export.dart';

class ThemeSettings extends ChangeNotifier {
  ThemeSettings() {
    loadTheme();
  }

  loadTheme() async {
    debugPrint("theme loaded");
    BoolRef.themeChange = await Injector.getTheme();
    if (BoolRef.themeChange == true) {
      ColorRef.backgroundColor = ColorRef.grey4E6B86;
      ColorRef.textPrimaryColor = ColorRef.white;
    } else {
      ColorRef.backgroundColor = ColorRef.greyEDEDED;
      ColorRef.textPrimaryColor = Colors.black;
    }

    notifyListeners();
  }
}
