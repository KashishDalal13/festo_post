import 'package:festo_post/module/login_module/register_info.dart';
import 'package:festo_post/module/login_module/register_provider.dart';
import 'package:festo_post/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (BuildContext context) => RegisterProvider(),
      builder: (context, child) {
        RegisterProvider provider = context.watch<RegisterProvider>();
        return SafeArea(
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
              // Other properties of AppBar
            ),
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 66), // flex: 6,
                  // height: height / 1.5,
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
                              const SizedBox(height: 15),
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
                                      // Add margin here
                                      child: Text(
                                        provider.introIndex == 2
                                            ? data.title2
                                            : "",
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Lato',
                                        ),
                                        textAlign: TextAlign
                                            .center, // Ensure text alignment is centered
                                        // overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis if necessary
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 15),
                              SvgPicture.asset(data.image, height: width - 200),
                              const SizedBox(height: 15),
                              Text(data.descriptions,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato'),
                                  textAlign: TextAlign.center),
                              const SizedBox(height: 15),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  // Grey background color
                                  borderRadius: BorderRadius.circular(
                                      20), // Rounded corners
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    // Adjust padding
                                    hintText: StrRef.contact,
                                    hintStyle: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 20,
                                        color: ColorRef.grey929292),
                                    prefixIcon: const Icon(Icons.phone),
                                    // Icon added here
                                    border: InputBorder.none, // Remove border
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              // Button added here
                              GestureDetector(
                                onTap: () => provider.onOTP(),
                                child: Container(
                                  height: 50,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: ColorRef.yellowFFA500,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      provider.introIndex == 2
                                          ? StrRef.verifyText
                                          : StrRef.verify,
                                      style: TextStyle(
                                          color: ColorRef.black202020,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Lato'),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              GestureDetector(
                                onTap: () => provider.onOTP(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      provider.introIndex == 2
                                          ? ""
                                          : StrRef.whatsApp,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Lato'),
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      provider.introIndex == 2
                                          ? ""
                                          : StrRef.sms,
                                      style: TextStyle(
                                          color: ColorRef.yellowFFA500,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Lato'),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 200),
                              provider.introIndex == 0
                                  ? GestureDetector(
                                      onTap: () => provider.onLogin(),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            provider.introIndex == 2
                                                ? ""
                                                : StrRef.accountExists,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Lato'),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            provider.introIndex == 2
                                                ? ""
                                                : StrRef.login,
                                            style: TextStyle(
                                                color: ColorRef.blue0250A4,
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Lato'),
                                          ),
                                        ],
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () => provider.onCreateAccount(),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            provider.introIndex == 2
                                                ? ""
                                                : StrRef.accountNotExists,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            provider.introIndex == 2
                                                ? ""
                                                : StrRef.register,
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
        );
      },
    );
  }
}
