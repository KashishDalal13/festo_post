import 'package:festo_post/theme_change/theme_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'on_boarding/on_boarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => ThemeSettings(),
        builder: (context, child) {
          ThemeSettings settings = context.watch<ThemeSettings>();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: settings.switchValue ? ThemeData.dark() : ThemeData.light(),
            home: const OnBoardingScreen(),
          );
        });
  }
}
