import 'package:provider/provider.dart';

import '../../../app_export.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => SplashViewProvider(),
        builder: (context, child) {
          SplashViewProvider provider = context.watch<SplashViewProvider>();
          return Theme(
            data: BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
            child: const Scaffold(
              body: Center(child: FlutterLogo(size: 100)),
            ),
          );
        });
  }
}
