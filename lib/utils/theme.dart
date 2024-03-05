import 'package:festo_post/utils/text_style.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class ThemeRef {
  static ThemeData lightTheme = ThemeData(
          appBarTheme: AppBarTheme(titleTextStyle: TextStyle(fontSize: 18, color: ColorRef.black202020),backgroundColor: ColorRef.white,centerTitle: true),
          scaffoldBackgroundColor: ColorRef.white,
          textTheme: CustomTextTheme.textTheme,
          splashFactory: NoSplash.splashFactory,
          splashColor: ColorRef.transparent,
          highlightColor: ColorRef.transparent,
          hoverColor: ColorRef.transparent,
          buttonTheme: ButtonThemeData(splashColor: ColorRef.transparent, highlightColor: ColorRef.transparent, hoverColor: ColorRef.transparent),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          })),
      darkTheme = ThemeData(
          appBarTheme: AppBarTheme(titleTextStyle: TextStyle(fontSize: 18, color: ColorRef.white),backgroundColor: ColorRef.blue1E2A38),
          scaffoldBackgroundColor: ColorRef.blue1E2A38,
          textTheme: CustomTextTheme.textTheme,
          splashFactory: NoSplash.splashFactory,
          splashColor: ColorRef.transparent,
          highlightColor: ColorRef.transparent,
          hoverColor: ColorRef.transparent,
          buttonTheme: ButtonThemeData(splashColor: ColorRef.transparent, highlightColor: ColorRef.transparent, hoverColor: ColorRef.transparent),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }));
}
