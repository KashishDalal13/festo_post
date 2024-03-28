import 'package:festo_post/module/dashboard_module/view/dashboard_view.dart';
import 'package:festo_post/module/frameEditing_module/view/frameEditing_view.dart';
import 'package:festo_post/module/imageEdit_module/view/imageEdit_view.dart';
import 'package:festo_post/module/splash_module/view/splash_screen_view.dart';
import 'package:festo_post/shared/injector.dart';
import 'package:festo_post/utils/bool.dart';
import 'package:festo_post/utils/colors.dart';
import 'package:festo_post/utils/routes.dart';
import 'package:festo_post/theme_change/theme_settings.dart';
import 'package:festo_post/utils/string.dart';
import 'package:festo_post/utils/theme.dart';
import 'package:festo_post/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'module/info_module/view/info_view.dart';
import 'module/login_module/view/user_auth_view.dart';
import 'module/on_boarding/on_boarding_view.dart';
import 'module/profile_module/view/profile_view.dart';

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
        create: (BuildContext context) => ThemeSettings(),
        builder: (context, child) {
          debugPrint(" BoolRef themeChange ${BoolRef.themeChange}");
          return MaterialApp(
            initialRoute: '/',
            navigatorKey: NavigationService.navigatorKey,
            scaffoldMessengerKey: Toast.snackBarKey,
            debugShowCheckedModeBanner: false,
            theme: BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
            // theme: settings.switchValue ? ThemeData.dark() : ThemeData.light(),
            routes: {
              '/': (context) => const SplashScreenView(),
              'onboarding': (context) => const OnBoardingScreen(),
              'register': (context) => const UserAuthView(),
              'dashboard': (context) => const DashBoardView(),
              'profile': (context) => const ProfileView(),
              'frame': (context) => const FrameEditorView(),
              'info': (context) => const InfoView(),
              'imageEdit': (context) => const ImageEditView(),
            },
          );
        });
  }
}
