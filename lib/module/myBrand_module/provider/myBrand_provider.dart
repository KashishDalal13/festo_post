import 'package:festo_post/app_export.dart';

class MyBrandProvider extends ChangeNotifier {

  onBack() {
    NavigationService.goBack();
  }

  onSubscribe() {
    NavigationService.replaceToNamed('SubscriptionPlan');
  }

}