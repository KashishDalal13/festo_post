import 'package:festo_post/app_export.dart';

class RegisterProvider extends ChangeNotifier {
  int introIndex = 0;
  double process = 0.33;
  Duration? timer;
  final pageController = PageController();
  Duration timerDuration = const Duration(seconds: 50);
  String otp = '';
  late Timer _timer;
  int selected = 0;
  TextEditingController brandName = TextEditingController(),
      brandMob = TextEditingController(),
      brandEmail = TextEditingController(),
      brandWeb = TextEditingController(),
      brandAdd = TextEditingController();

  bool timerActive = false, toggleWhatsAppOrSms = false, toggleLoginOrRegister = false;
  TextEditingController phoneController = TextEditingController(), otpController = TextEditingController(), referralCodeController = TextEditingController();

  // payal
  List<Map<String, dynamic>> addDetail = [
    {"svg": SvgPath.tag, "label": StrRef.brandName, "controller": TextEditingController()},
    {"svg": SvgPath.suitcase, "label": StrRef.brandCat, "controller": TextEditingController()},
    {"svg": SvgPath.phone, "label": StrRef.contact, "controller" "": TextEditingController()},
    {"svg": SvgPath.email, "label": StrRef.email, "controller": TextEditingController()},
    {"svg": SvgPath.web, "label": StrRef.website, "controller": TextEditingController()},
    {"svg": SvgPath.location, "label": StrRef.businessAddress, "controller": TextEditingController()},
  ];

  //Roshni
  void startTimer() {
    timerDuration = const Duration(seconds: 50);
    if (timerDuration != Duration.zero) {
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        final seconds = (timerDuration.inSeconds - 1);
        if (timerDuration.inSeconds <= 0) {
          _timer.cancel();
          notifyListeners();
          timerDuration = Duration.zero;
        } else {
          timerDuration = Duration(seconds: seconds);
        }
        notifyListeners();
      });
    }
  }

  //Roshni
  void onVerify() {
    if (phoneController.text.isEmpty) {
      Toast.toast(msg: "Please enter mobile number");
    } else if (phoneController.text.length < 10) {
      debugPrint("${phoneController.text.length}");
      Toast.toast(msg: "Mobile number must be 10 digits long");
    } else {
      introIndex = 1;
      for (int i = 0; i < 4; i++) {
        otp += Random().nextInt(10).toString();
      }
      notifyListeners();
      debugPrint(otp);
      Toast.toast(msg: "Your OTP for Festo Post is $otp");
      startTimer();
    }
    notifyListeners();
  }

  //Roshni
  onToggleLoginOrRegister() {
    toggleLoginOrRegister = !toggleLoginOrRegister;
    notifyListeners();
  }

  //Roshni
  void onBack() {
    if (introIndex == 1) {
      introIndex = 0;
      _timer.cancel();
    } else {
      introIndex--;
    }
    notifyListeners();
  }

  onIndexChange({required int index}) {
    introIndex = index;
    notifyListeners();
  }

  void onOtpVerify() {
    if (otpController.value.text.isEmpty) {
      Toast.toast(msg: "Please enter OTP number");
    } else if (otpController.value.text.length < 4) {
      Toast.toast(msg: "Please enter valid Otp number");
    } else if (otpController.value.text != otp) {
      Toast.toast(msg: "Wrong Otp number");
    } else {
      introIndex = 2;
      _timer.cancel();
      Injector.setSignIn();
    }
    notifyListeners();
  }

  onAddSubmit() {
    if (referralCodeController.value.text.isNotEmpty) {
      NavigationService.replaceToNamed('register');
    } else {
      Toast.toast(msg: "Please enter ReferralCode");
    }
  }

  onSkipOrSubmit() {
    NavigationService.replaceToNamed('dashboard');
    notifyListeners();
  }

  void onOtpSuccess() {
    introIndex = 3;
    notifyListeners();
  }
}
