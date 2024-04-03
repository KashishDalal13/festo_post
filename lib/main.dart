import 'package:festo_post/app_export.dart';

import 'module/imageEdit_module/view/audio_view.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Injector.getTheme();
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
          ThemeSettings themeSettings = context.watch<ThemeSettings>();
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
              'downloadPost': (context) => const DownloadPostView(),
              'myBrand': (context) => const MyBrandView(),
              'SubscriptionPlan': (context) => const SubscriptionPlanView(),
              'brandDetails': (context) => const BrandDetailsView(),
              'payment': (context) => const PaymentView(),
              'myPost': (context) => const MyPostView(),
              'finalPayment': (context) => const FinalPayment(),
              'referralPoints': (context) => const ReferralPoints(),
              'transaction': (context) => const TransactionView(),
              'audio': (context) => const AudioView(),
            },
          );
        });
  }
}
