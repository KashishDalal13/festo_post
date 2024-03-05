import 'package:festo_post/module/login_module/register_provider.dart';
import 'package:festo_post/module/login_module/register_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';
import 'package:pinput/pinput.dart';

import '../../utils/string.dart';
import 'otp_view.dart';

class UserAuthView extends StatelessWidget {
  const UserAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    var focusedBorderColor = ColorRef.black202020;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: TextStyle(fontSize: 22, color: ColorRef.black),
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
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: Visibility(
                visible: provider.introIndex == 1,
                child: IconButton(
                  onPressed: () => provider.onBack(),
                  icon: const Icon(Icons.arrow_back_ios_rounded,size: 20),
                ),
              ),
              centerTitle: true,
              title: Text(provider.introIndex == 1 ? StrRef.otp : "",style:TextStyle(fontFamily: 'Lato', fontSize: 18, color: ColorRef.black202020)),
              // Other properties of AppBar
            ),
            resizeToAvoidBottomInset: false,
            body: IndexedStack(
              index: provider.introIndex,
              children:  [
                RegisterView(provider: provider),
                OtpView(provider: provider),              ],
              /*provider.items.map(
                (e) {
                  RegisterInfo data = e;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data.title,
                            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
                          ),
                          Text(
                            provider.introIndex == 2 ? "" : data.title2,
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Lato', color: ColorRef.yellowFFA500),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(8.0), // Add margin here
                              child: Text(
                                provider.introIndex == 2 ? data.title2 : "",
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, fontFamily: 'Lato'),
                                textAlign: TextAlign.center, // Ensure text alignment is centered
                                // overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis if necessary
                              ),
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(data.image, height: width - 200),
                      const SizedBox(height: 10),
                      Visibility(
                        visible: provider.introIndex != 2,
                        child: Text(data.descriptions, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Lato'), textAlign: TextAlign.center),
                      ),
                      const SizedBox(height: 10),
                      if (provider.introIndex != 3)
                        provider.introIndex == 2
                            ? Pinput(
                                length: 4,
                                defaultPinTheme: defaultPinTheme,
                                focusedPinTheme: defaultPinTheme.copyWith(
                                  decoration: defaultPinTheme.decoration!.copyWith(
                                    border: Border.all(color: ColorRef.greyD6D6D6),
                                  ),
                                ),
                                androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                                listenForMultipleSmsOnAndroid: true,
                                separatorBuilder: (index) => const SizedBox(width: 15),

                                // validator: (value) {
                                //   return value == '2222' ? null : 'Pin is incorrect';
                                // },
                                cursor: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 9),
                                      width: 22,
                                      height: 1,
                                      color: focusedBorderColor,
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorRef.greyEDEDED),
                                margin: const EdgeInsets.symmetric(horizontal: 40),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    constraints: const BoxConstraints(maxHeight: 45),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    hintText: StrRef.contact,
                                    hintStyle: TextStyle(fontFamily: 'Lato', fontSize: 15, color: ColorRef.grey929292),
                                    prefixIcon: const Icon(Icons.phone, size: 20),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                      const SizedBox(height: 10),
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
                            const SizedBox(
                              width: 5,
                            ),
                            if (provider.introIndex == 2 && isTimerActive)
                              Text(
                                '00:$timerDuration',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorRef.blue0250A4),
                              ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                      // Button added here
                      if (provider.introIndex != 3)
                        GestureDetector(
                          onTap: () {
                            if (provider.introIndex == 2) {
                              provider.onOTPsuccess();
                            } else {
                              provider.onOTP();
                            }
                          },
                          child: Container(
                            height: 40,
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(color: ColorRef.yellowFFA500, borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                provider.introIndex == 2 ? StrRef.verifyText : StrRef.verify,
                                style: TextStyle(color: ColorRef.black202020, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => provider.onOTP(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (provider.introIndex != 2 && provider.introIndex != 3)
                              Text(
                                StrRef.whatsApp,
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Lato'),
                              ),
                            const SizedBox(width: 2),
                            if (provider.introIndex != 2 && provider.introIndex != 3)
                              Text(
                                StrRef.sms,
                                style: TextStyle(color: ColorRef.yellowFFA500, fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Lato'),
                              ),
                          ],
                        ),
                      ),
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
                                      style: TextStyle(color: ColorRef.blue0250A4, fontSize: 18, fontWeight: FontWeight.normal),
                                    ),
                                ],
                              ),
                            )
                    ],
                  );
                },
              ).toList(),*/
            ),
          ),
        );
      },
    );
  }
}
