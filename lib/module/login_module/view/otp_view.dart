import 'package:festo_post/module/login_module/provider/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/colors.dart';
import '../../../utils/string.dart';

class OtpView extends StatelessWidget {
  final RegisterProvider provider;

  const OtpView({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: TextStyle(fontSize: 15, color: ColorRef.black),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: ColorRef.greyD6D6D6),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => provider.onBack(), icon: const Icon(Icons.arrow_back_ios_rounded, size: 20)),
        centerTitle: true,
        title: Text(StrRef.otp, style: TextStyle(fontFamily: 'Lato', fontSize: 18, color: ColorRef.black202020)),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            StrRef.otpTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
          ),
          const SizedBox(height: 10),
          SvgPicture.asset(SvgPath.otpImg, height: width - 120),
          const SizedBox(height: 10),
          Pinput(
            length: 4,
            controller: provider.otpController,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                border: Border.all(color: ColorRef.greyD6D6D6),
              ),
            ),
            androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
            listenForMultipleSmsOnAndroid: true,
            separatorBuilder: (index) => const SizedBox(width: 15),
            cursor: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(margin: const EdgeInsets.only(bottom: 9), width: 22, height: 1, color: ColorRef.black202020),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StrRef.resendOtp,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Lato'),
              ),
              const SizedBox(width: 5),
              //"${timerDuration.value.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(timerDuration.value.inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}",
              if (provider.introIndex == 1 && provider.timerDuration != Duration.zero)
                Text(
                  "${provider.timerDuration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(provider.timerDuration.inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: ColorRef.blue0250A4),
                ),
              const SizedBox(height: 15),
            ],
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () => provider.onOtpVerify(),
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(color: ColorRef.yellowFFA500, borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              child: Text(
                StrRef.verifyText,
                style: TextStyle(color: ColorRef.black202020, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
