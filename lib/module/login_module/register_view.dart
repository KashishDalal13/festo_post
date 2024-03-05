import 'package:festo_post/module/login_module/register_info.dart';
import 'package:festo_post/module/login_module/register_provider.dart';
import 'package:festo_post/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';
import 'package:pinput/pinput.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  final TextEditingController mobileNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var focusedBorderColor = ColorRef.black202020;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: ColorRef.greyD6D6D6),
      ),
    );
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (BuildContext context) => RegisterProvider(),
      builder: (context, child) {
        RegisterProvider provider = context.watch<RegisterProvider>();
        int timerDuration = provider.getTimerDuration();
        bool isTimerActive = provider.isTimerActive();
        return SafeArea(
          child: GestureDetector(
            onTap: () {
              if (!FocusScope.of(context).hasPrimaryFocus) {
                FocusScope.of(context).unfocus();
              }
            },
            child: Scaffold(
              appBar: AppBar(
                leading: Visibility(
                  visible: provider.introIndex == 2,
                  child: IconButton(
                    onPressed: () => provider.onCreateAccount(),
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                  ),
                ),
                title: Center(
                  child: Text(provider.introIndex == 2 ? StrRef.otp : ""),
                ),
              ),
              resizeToAvoidBottomInset: false,
              body: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: IndexedStack(
                        index: provider.introIndex,
                        children: provider.items.map(
                              (e) {
                            RegisterInfo data = e;
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 60),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: width * 0.05),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        data.title,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Lato'),
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        provider.introIndex == 2 ? "" : data.title2,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Lato',
                                            color: ColorRef.yellowFFA500),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.all(8.0),
                                          child: Text(
                                            provider.introIndex == 2 ? data.title2 : "",
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Lato',
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: width * 0.05),
                                  SvgPicture.asset(data.image, height: width - 200),
                                  SizedBox(height: width * 0.05),
                                  Visibility(
                                    visible: provider.introIndex != 2,
                                    child: Text(data.descriptions,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Lato'),
                                        textAlign: TextAlign.center),
                                  ),
                                  const SizedBox(height: 15),
                                  if (provider.introIndex != 3)
                                    provider.introIndex == 2
                                        ? Pinput(
                                      length: 4,
                                      defaultPinTheme: defaultPinTheme,
                                      validator: (valuee) {
                                        if (valuee == null || valuee.isEmpty) {
                                          return 'Please enter OTP';
                                        }
                                        return null;
                                      },
                                      focusedPinTheme:
                                      defaultPinTheme.copyWith(
                                        decoration: defaultPinTheme.decoration!.copyWith(
                                          border: Border.all(
                                              color: ColorRef.greyD6D6D6),
                                        ),
                                      ),
                                      androidSmsAutofillMethod:
                                      AndroidSmsAutofillMethod.smsUserConsentApi,
                                      listenForMultipleSmsOnAndroid: true,
                                      separatorBuilder: (index) =>
                                      const SizedBox(width: 15),
                                      cursor: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 9),
                                            width: 22,
                                            height: 1,
                                            color: focusedBorderColor,
                                          ),
                                        ],
                                      ),
                                    )
                                        : Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: ColorRef.greyEDEDED,
                                      ),
                                      child: TextFormField(
                                        controller: mobileNumberController,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter mobile number';
                                          } else if (value.length < 10 || value.length > 10) {
                                            return 'Mobile number must be 10 digits long';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 15,
                                          ),
                                          hintText: StrRef.contact,
                                          hintStyle: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 20,
                                            color: ColorRef.grey929292,
                                          ),
                                          prefixIcon: const Icon(Icons.phone),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  SizedBox(height: width * 0.04),
                                  Visibility(
                                    visible: provider.introIndex == 2,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          data.descriptions,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Lato',
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(width: 5,),
                                        if (provider.introIndex == 2 && isTimerActive)
                                          Text(
                                            '00:$timerDuration',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: ColorRef.blue0250A4
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: width * 0.03),
                                  if (provider.introIndex != 3)
                                    GestureDetector(
                                      onTap: () {
                                        if ( _formKey.currentState!.validate()) {
                                          print("form");
                                          if (provider.introIndex == 0 || provider.introIndex == 1) { // Changed && to ||
                                            print("register");
                                            provider.onOTPByWp(mobileNumberController.text);
                                          }
                                          }
                                        if(provider.introIndex == 2) {
                                          print("success");
                                          provider.onOTPsuccess();
                                        }
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 400,
                                        decoration: BoxDecoration(
                                          color: ColorRef.yellowFFA500,
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        child: Center(
                                          child:
                                          Text(
                                            provider.introIndex == 2 ? StrRef.verifyText : StrRef.verify,
                                            style: TextStyle(
                                                color: ColorRef.black202020,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Lato'
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  SizedBox(height: width * 0.05),
                                  GestureDetector(
                                    onTap: () => provider.onOTPBySMS(mobileNumberController.text),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        if (provider.introIndex != 2 && provider.introIndex != 3)
                                          Text(
                                            StrRef.whatsApp,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Lato'),
                                          ),
                                        const SizedBox(width: 2),
                                        if (provider.introIndex != 2 && provider.introIndex != 3)
                                          Text(
                                            StrRef.sms,
                                            style: TextStyle(
                                                color: ColorRef.yellowFFA500,
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Lato'),
                                          ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: width * 0.4),
                                  provider.introIndex == 0
                                      ? GestureDetector(
                                    onTap: () => provider.onLogin(),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        if (provider.introIndex != 2 && provider.introIndex != 3)
                                          Text(
                                            StrRef.accountExists,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Lato',
                                            ),
                                          ),
                                        const SizedBox(width: 5),
                                        if (provider.introIndex != 2 && provider.introIndex != 3)
                                          Text(
                                            StrRef.login,
                                            style: TextStyle(
                                              color: ColorRef.blue0250A4,
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Lato',
                                            ),
                                          ),
                                      ],
                                    ),
                                  )
                                      : GestureDetector(
                                    onTap: () => provider.onCreateAccount(),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        if (provider.introIndex != 2 && provider.introIndex != 3)
                                          Text(
                                            StrRef.accountNotExists,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        const SizedBox(width: 5),
                                        if (provider.introIndex != 2 && provider.introIndex != 3)
                                          Text(
                                            StrRef.register,
                                            style: TextStyle(
                                              color: ColorRef.blue0250A4,
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
