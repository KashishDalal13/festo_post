import 'package:festo_post/app_export.dart';

class ProfileProvider extends ChangeNotifier {
  List<Map<String, dynamic>> profileDetails = [
    {"icon": SvgPath.profile, "label": StrRef.accountDetails, "route": ''},
    {"icon": SvgPath.savePost, "label": StrRef.savePost, "route": ''},
    {"icon": SvgPath.tag, "label": StrRef.brandSubscript, "route": 'myBrand'},
    {"icon": SvgPath.rewardPoints, "label": StrRef.rewardPoints, "route": ''},
    {"icon": SvgPath.transaction, "label": StrRef.transaction, "route": ''},
    {"icon": SvgPath.logout, "label": StrRef.logout, "route": ''},
  ];

  List<Map<String, dynamic>> addDetail = [
    {"svg": SvgPath.tag, "label": StrRef.brandName, "controller": TextEditingController()},
    {"svg": SvgPath.suitcase, "label": StrRef.brandCat, "controller": TextEditingController()},
    {"svg": SvgPath.phone, "label": StrRef.contact, "controller": TextEditingController()},
    {"svg": SvgPath.email, "label": StrRef.email, "controller": TextEditingController()},
    {"svg": SvgPath.web, "label": StrRef.website, "controller": TextEditingController()},
    {"svg": SvgPath.location, "label": StrRef.businessAddress, "controller": TextEditingController()},
  ];

  List<Map<String, dynamic>> subscription = [
    {"title": StrRef.subscriptionTitle, "offer": StrRef.subscriptOfferRupees, "actualRupees": StrRef.subscriptionRupees, "offerDetails1": StrRef.offerDetails1, "offerDetails2": StrRef.offerDetails2, "offerDetails3": StrRef.offerDetails3, "offerDetails4": StrRef.offerDetails4},
    {"title": StrRef.subscriptionTitle, "offer": StrRef.subscriptOfferRupees, "actualRupees": StrRef.subscriptionRupees, "offerDetails1": StrRef.offerDetails1, "offerDetails2": StrRef.offerDetails2, "offerDetails3": StrRef.offerDetails3, "offerDetails4": StrRef.offerDetails4},
    {"title": StrRef.subscriptionTitle, "offer": StrRef.subscriptOfferRupees, "actualRupees": StrRef.subscriptionRupees, "offerDetails1": StrRef.offerDetails1, "offerDetails2": StrRef.offerDetails2, "offerDetails3": StrRef.offerDetails3, "offerDetails4": StrRef.offerDetails4},
  ];

  List<String> category = ['Agriculture', 'Advertising', 'Technology & Software', 'Beauty', 'Education', 'Construction', 'Alternative Medicine'];

  bool isExpand = false;
  String selectedBrandIndex = '';

  onBack() {
    NavigationService.goBack();
  }

  onListTileTap({required int index}) {
    if (index == 1) {
      isExpand = !isExpand;
      selectedBrandIndex = index.toString();
      notifyListeners();
    }
  }

  onSelectBrandCategory({required String brand}) {
    addDetail[int.parse(selectedBrandIndex)]['label'] = brand;
    debugPrint("${addDetail[int.parse(selectedBrandIndex)]['label']}");
    notifyListeners();
  }
}
