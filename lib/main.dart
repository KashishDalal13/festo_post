import 'package:festo_post/module/dashboard_module/view/dashboard_view.dart';
import 'package:festo_post/profile_module/view/profile_view.dart';
import 'package:festo_post/shared/injector.dart';
import 'package:festo_post/utils/bool.dart';
import 'package:festo_post/utils/colors.dart';
import 'package:festo_post/utils/routes.dart';
import 'package:festo_post/theme_change/theme_settings.dart';
import 'package:festo_post/utils/theme.dart';
import 'package:festo_post/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'module/login_module/view/user_auth_view.dart';
import 'module/on_boarding/on_boarding_view.dart';
import 'module/setting_module/view/setting_view.dart';

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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => ThemeSettings(),
        builder: (context, child) {
          debugPrint(" BoolRef themeChange ${BoolRef.themeChange}");
          return MaterialApp(
            initialRoute: 'dashboard',
            navigatorKey: NavigationService.navigatorKey,
            scaffoldMessengerKey: Toast.snackBarKey,
            debugShowCheckedModeBanner: false,
            theme:  BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
            // theme: settings.switchValue ? ThemeData.dark() : ThemeData.light(),
            routes: {
              '/': (context) => const OnBoardingScreen(),
              'register': (context) => const UserAuthView(),
              'dashboard':(context)=>const dashboardView(),
              'setting':(context)=>const SettingView(),
              'profile':(context)=>const ProfileView(),
            },
          );
        });
  }
}

