import 'package:festo_post/app_export.dart';

class ProfileProvider extends ChangeNotifier {
  List<Map<String, dynamic>> profileDetails = [
    {"icon": SvgPath.profile, "label": StrRef.accountDetails, "route": ''},
    {"icon": SvgPath.savePost, "label": StrRef.savePost, "route": 'myPost'},
    {"icon": SvgPath.tag, "label": StrRef.brandSubscript, "route": 'myBrand'},
    {"icon": SvgPath.rewardPoints, "label": StrRef.rewardPoints, "route": ''},
    {"icon": SvgPath.transaction, "label": StrRef.transaction, "route": ''},
    {"icon": SvgPath.logout, "label": StrRef.logout, "route": null},
  ];

  onMyAccountNavigate(int index, BuildContext context) {
    if (profileDetails[index]['label'] == StrRef.logout) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Theme(
            data: BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
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

  bool isEdit=false;
  onTapEdit(){
    isEdit = !isEdit;
    notifyListeners();
  }
}
