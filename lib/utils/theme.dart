import 'package:festo_post/app_export.dart';

class ThemeRef {
  static ThemeData lightTheme = ThemeData(
          appBarTheme: AppBarTheme(titleTextStyle: TextStyle(fontSize: 18, color: ColorRef.black202020), backgroundColor: ColorRef.white, centerTitle: true),
          scaffoldBackgroundColor: ColorRef.white,
          textTheme: CustomTextTheme.textTheme,
          splashFactory: NoSplash.splashFactory,
          splashColor: ColorRef.transparent,
          highlightColor: ColorRef.transparent,
          hoverColor: ColorRef.transparent,
          listTileTheme: ListTileThemeData(tileColor: ColorRef.white),
          popupMenuTheme: PopupMenuThemeData(color: ColorRef.white, surfaceTintColor: ColorRef.white,),
          drawerTheme: DrawerThemeData(backgroundColor: ColorRef.white, surfaceTintColor: ColorRef.white),
          buttonTheme: ButtonThemeData(splashColor: ColorRef.transparent, highlightColor: ColorRef.transparent, hoverColor: ColorRef.transparent),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          })),
      darkTheme = ThemeData(
          appBarTheme: AppBarTheme(titleTextStyle: TextStyle(fontSize: 18, color: ColorRef.white), backgroundColor: ColorRef.blue1E2A38),
          scaffoldBackgroundColor: ColorRef.blue1E2A38,
          textTheme: CustomTextTheme.textTheme,
          splashFactory: NoSplash.splashFactory,
          splashColor: ColorRef.transparent,
          highlightColor: ColorRef.transparent,
          hoverColor: ColorRef.transparent,
          listTileTheme: ListTileThemeData(tileColor: ColorRef.grey304359),
          popupMenuTheme: PopupMenuThemeData(color: ColorRef.grey304359, surfaceTintColor: ColorRef.grey304359),
          drawerTheme: DrawerThemeData(backgroundColor: ColorRef.blue1E2A38),
          buttonTheme: ButtonThemeData(splashColor: ColorRef.transparent, highlightColor: ColorRef.transparent, hoverColor: ColorRef.transparent),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }));
}
