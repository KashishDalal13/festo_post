import '../../../app_export.dart';

class SubscriptionPlanView extends StatelessWidget {
  const SubscriptionPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileProvider(),
      builder: (context, child) {
        ProfileProvider provider = context.watch<ProfileProvider>();
        return const Scaffold(
          body: Text("plan"),
        );
      },
    );
  }
}
