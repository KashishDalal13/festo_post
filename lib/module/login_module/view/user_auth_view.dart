import 'package:festo_post/app_export.dart';

class UserAuthView extends StatelessWidget {
  const UserAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (BuildContext context) => RegisterProvider(),
      builder: (context, child) {
        RegisterProvider provider = context.watch<RegisterProvider>();
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: IndexedStack(
              index: provider.introIndex,
              children: [
                RegisterView(provider: provider),
                OtpView(provider: provider),
                ReferralView(provider: provider),
                AddDetails(provider: provider),
              ],
            ),
          ),
        );
      },
    );
  }
}
