import 'package:festo_post/app_export.dart';

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
