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
        return Scaffold(
          appBar: AppBar(
              leading: IconButton(onPressed: () => provider.onBack(), icon: Icon(Icons.arrow_back_ios_rounded, size: 20, color: ColorRef.textPrimaryColor)),
              centerTitle: true,
              title: Text(StrRef.selectPlan, style: const TextStyle(fontFamily: 'Lato', fontSize: 18))),
          body: Text("plan"),
        );
      },
    );
  }
}
