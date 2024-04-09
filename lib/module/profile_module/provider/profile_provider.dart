import 'dart:ui';

import 'package:festo_post/app_export.dart';

class ProfileProvider extends ChangeNotifier {
  bool switchValue = false;
  List<Map<String, dynamic>> profileDetails = [
    {"icon": SvgPath.savePost, "label": StrRef.savePost, "route": 'myPost'},
    {"icon": SvgPath.tag, "label": StrRef.brandSubscript, "route": 'myBrand'},
    {"icon": SvgPath.rewardPoints, "label": StrRef.rewardPoints, "route": 'referralPoints'},
    {"icon": SvgPath.transaction, "label": StrRef.transaction, "route": 'transaction'},
    {"icon": SvgPath.theme, "label": StrRef.darkTheme, "route": null},
    {"icon": SvgPath.contactUs, "label": StrRef.contactUs, "route": 'contactUs'},
    {"icon": SvgPath.aboutUs, "label": StrRef.aboutUs, "route": 'aboutUs'},
    {"icon": SvgPath.privacy, "label": StrRef.privacy, "route": 'privacy'},
    {"icon": SvgPath.refund, "label": StrRef.refund, "route": 'refund'},
    {"icon": SvgPath.terms, "label": StrRef.terms, "route": 'terms'},
    {"icon": SvgPath.logout, "label": StrRef.logout, "route": null},
    // {"icon": SvgPath.logout, "label": StrRef.logout, "route": null},
  ];

  void toggleTheme() async {
    switchValue = !switchValue;
    Injector.setTheme(themeVal: switchValue);
    notifyListeners();
    // NavigationService.replaceAllToNamed("/");
    ThemeSettings();
  }

  onMyAccountNavigate(int index, BuildContext context) {
    if (profileDetails[index]['label'] == StrRef.logout) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Theme(
            data: BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                backgroundColor: BoolRef.themeChange ? ColorRef.blue1E2A38: ColorRef.whiteFFFFFF,
                surfaceTintColor: BoolRef.themeChange ? ColorRef.blue1E2A38: ColorRef.whiteFFFFFF,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SvgPicture.asset(SvgPath.logout, height: 35, width: 35, color:BoolRef.themeChange ? ColorRef.textPrimaryColor: ColorRef.grey5c5c5c),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(StrRef.logoutSure,
                        textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Lato', fontSize: 15, fontWeight: FontWeight.w400, color: ColorRef.textPrimaryColor)),
                    const SizedBox(
                      height: 22,
                    ),
                    GestureDetector(
                      onTap: () {
                        Injector.setSignIn(signIn: false);
                        NavigationService.replaceAllToNamed("register");
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        decoration: BoxDecoration(
                          color: ColorRef.yellowFFA500,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(StrRef.logoutBtn, style: TextStyle(fontFamily: 'Lato', fontSize: 15, fontWeight: FontWeight.w600, color: ColorRef.textPrimaryColor)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else {
      NavigationService.routeToNamed(profileDetails[index]['route']);
    }
  }

  List<Map<String, dynamic>> addDetail = [
    {"svg": SvgPath.tag, "label": StrRef.brandName, "controller": TextEditingController()},
    {"svg": SvgPath.suitcase, "label": StrRef.brandCat, "controller": TextEditingController()},
    {"svg": SvgPath.phone, "label": StrRef.contact, "controller": TextEditingController()},
    {"svg": SvgPath.email, "label": StrRef.email, "controller": TextEditingController()},
    {"svg": SvgPath.web, "label": StrRef.website, "controller": TextEditingController()},
    {"svg": SvgPath.location, "label": StrRef.businessAddress, "controller": TextEditingController()},
  ];
  //bnb

  List<Map<String, dynamic>> subscription = [
    {"title": StrRef.subscriptionTitle, "offer": StrRef.subscriptOfferRupees, "actualRupees": StrRef.subscriptionRupees, "offerDetails1": StrRef.offerDetails1, "offerDetails2": StrRef.offerDetails2, "offerDetails3": StrRef.offerDetails3, "offerDetails4": StrRef.offerDetails4},
    {"title": StrRef.subscriptionTitle, "offer": StrRef.subscriptOfferRupees, "actualRupees": StrRef.subscriptionRupees, "offerDetails1": StrRef.offerDetails1, "offerDetails2": StrRef.offerDetails2, "offerDetails3": StrRef.offerDetails3, "offerDetails4": StrRef.offerDetails4},
    {"title": StrRef.subscriptionTitle, "offer": StrRef.subscriptOfferRupees, "actualRupees": StrRef.subscriptionRupees, "offerDetails1": StrRef.offerDetails1, "offerDetails2": StrRef.offerDetails2, "offerDetails3": StrRef.offerDetails3, "offerDetails4": StrRef.offerDetails4},
  ];

  List<Map<String, dynamic>> availableCoupons = [
    {"offer": StrRef.applyCoupon, "offerCode": StrRef.couponCode1},
    {"offer": StrRef.discountCoupon, "offerCode": StrRef.couponCode1},
    {"offer": StrRef.festiveCoupon, "offerCode": StrRef.couponCode1},
  ];

  List<Map<String, dynamic>> paymentMethod = [
    {"icon": SvgPath.transaction, "type": StrRef.debitCard},
    {"icon": SvgPath.creditCard, "type": StrRef.creditCard},
    {"icon": SvgPath.upi, "type": StrRef.upi},
    {"icon": SvgPath.wallet, "type": StrRef.wallet},

  ];

  List<Map<String, dynamic>> referralDetail = [
    {"label": StrRef.referralLabel1, "date": "24th March", "time": "12:45", "points": "+1 pts"},
    {"label": StrRef.referralLabel2, "date": "30th Feb", "time": "2:00", "points": "-100 pts"},
    {"label": StrRef.referralLabel3, "date": "2th April", "time": "9:40", "points": "+500 pts"},
    {"label": StrRef.referralLabel2, "date": "5th Jan", "time": "10:02", "points": "-10 pts"},
    {"label": StrRef.referralLabel3, "date": "6th April", "time": "7:05", "points": "-800 pts"},
  ];

  List<String> category = ['Agriculture', 'Advertising', 'Technology & Software', 'Beauty', 'Education', 'Construction', 'Alternative Medicine'];

  bool isExpand = false;
  bool isUPI = false;
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

  bool isEdit=false;
  onTapEdit(){
    isEdit = !isEdit;
    notifyListeners();
  }

  onUPI(int index) {
    if (index == 2) {
      isUPI = !isUPI;
      notifyListeners();
    }
  }
}