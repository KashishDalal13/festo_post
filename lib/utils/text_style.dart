import 'package:festo_post/app_export.dart';

class CustomTextTheme {
  static TextStyle fontFamily = TextStyle(fontFamily: "Lato",color: ColorRef.textPrimaryColor);

  static TextTheme textTheme = TextTheme(
    bodyMedium: fontFamily,
    titleMedium: fontFamily,
    titleSmall: fontFamily,
    labelLarge: fontFamily,
    titleLarge: fontFamily,
    bodyLarge: fontFamily,
    bodySmall: fontFamily,
    labelMedium: fontFamily,
    labelSmall: fontFamily,
    headlineSmall: fontFamily,
    headlineLarge: fontFamily,
    headlineMedium: fontFamily,
    displayLarge: fontFamily,
    displayMedium: fontFamily,
    displaySmall: fontFamily,
  );
}
