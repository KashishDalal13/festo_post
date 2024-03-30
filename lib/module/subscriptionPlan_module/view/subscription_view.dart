import '../../../app_export.dart';

class SubscriptionPlanView extends StatelessWidget {
  const SubscriptionPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (BuildContext context) => SubscriptionPlanProvider(),
      builder: (context, child) {
        SubscriptionPlanProvider provider = context.watch<SubscriptionPlanProvider>();
        return Theme(
          data: BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
          child: Scaffold(
            body: Text("plan"),
          ),
        );
      },
    );
  }
}
