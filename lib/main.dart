import 'package:festo_post/shared/injector.dart';
import 'package:festo_post/utils/colors.dart';
import 'package:festo_post/utils/routes.dart';
import 'package:festo_post/theme_change/theme_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'module/login_module/register_view.dart';
import 'on_boarding/on_boarding_view.dart';
import 'on_boarding/onboarding_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Injector();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: ColorRef.white,
    statusBarColor: ColorRef.white,
    statusBarBrightness: Brightness.dark,
    //set as per theme
    statusBarIconBrightness: Brightness.dark,
    //set as per theme
    systemNavigationBarIconBrightness: Brightness.dark, //set as per theme
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => IntroProvider(),
        builder: (context, child) {
          // ThemeSettings settings = context.watch<ThemeSettings>();
          IntroProvider provider = context.watch<IntroProvider>();
          debugPrint("Main ${provider.switchValue}");

          return MaterialApp(
            initialRoute: '/',
          navigatorKey: NavigationService.navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: provider.switchValue ? ThemeData.dark() : ThemeData.light(),
            routes: {
              '/':(context)=> const OnBoardingScreen(),
              'register':(context)=> const RegisterView(),
            },
          );
        });
  }
}

