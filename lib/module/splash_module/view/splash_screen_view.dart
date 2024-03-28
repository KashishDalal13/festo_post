import 'package:festo_post/module/splash_module/provider/splash_screen_provider.dart';
import 'package:festo_post/theme_change/theme_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => SplashViewProvider(),
        builder: (context, child) {
          ThemeSettings themeSettings = context.watch<ThemeSettings>();
          SplashViewProvider provider = context.watch<SplashViewProvider>();
          return const Scaffold(
            body: Center(child: FlutterLogo(size: 100)),
          );
        });
  }
}
