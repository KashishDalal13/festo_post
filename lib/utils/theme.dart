import 'package:festo_post/utils/text_style.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class ThemeRef {
  ThemeData lightTheme = ThemeData(
          scaffoldBackgroundColor: ColorRef.grey5c5c5c,
          textTheme: CustomTextTheme.textTheme,
          splashFactory: NoSplash.splashFactory,
          splashColor: ColorRef.transparent,
          highlightColor: ColorRef.transparent,
          hoverColor: ColorRef.transparent,
          buttonTheme: ButtonThemeData(splashColor: ColorRef.transparent, highlightColor: ColorRef.transparent, hoverColor: ColorRef.transparent),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          })),
      darkTheme = ThemeData(
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
            TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          }));
}
