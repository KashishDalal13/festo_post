import 'package:festo_post/module/login_module/register_info.dart';
import 'package:festo_post/module/login_module/register_provider.dart';
import 'package:festo_post/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../utils/string.dart';

/*class ReferralView extends StatelessWidget {
  const ReferralView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
        create: (BuildContext context) => RegisterProvider(),
        builder: (context, child) {
          // ThemeSettings settings = context.watch<ThemeSettings>();
          RegisterProvider provider = context.watch<RegisterProvider>();
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Text(
                StrRef.referral,
                style: const TextStyle(fontSize: 20, fontFamily: 'Lato'),
              )),
              leading: IconButton(
                onPressed: () => provider.onCreateAccount(),
                icon: const Icon(Icons.arrow_back_ios_rounded, size: 20),
              ),
              actions: [
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "Skip",
                    style: TextStyle(
                        color: ColorRef.blue0250A4,
                        fontFamily: 'Lato',
                        fontSize: 15),
                  ),
                )
              ],
            ),
            body: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 80), // flex: 6,
                  height: height / 1.5,
                  child: PageView(
                      controller: provider.pageController,
                      onPageChanged: (index) =>
                          provider.onIndexChange(index: index),
                      children: provider.items.map((e) {
                        RegisterInfo data = e;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 15),
                              RichText(textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: StrRef.referralTittle,
                                  style: const TextStyle(fontSize: 20, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: StrRef.reward,
                                      style: TextStyle(fontSize: 20,color: ColorRef.yellowFFA500),
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset(SvgPath.referral, height: width - 100),
                              const SizedBox(height: 15),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ColorRef.greyEDEDED,
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 15,
                                    ),
                                    hintText: StrRef.referralFormField,
                                    hintStyle: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 20,
                                      color: ColorRef.grey929292,
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: SvgPicture.asset(
                                        SvgPath.gift,
                                        height: 24, // Set the desired height
                                      ),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: width * 0.05),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: ColorRef.yellowFFA500,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      StrRef.submit,
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
                            ],
                          ),
                        );
                      }).toList()),
                )
              ],
            ),
          ));
        });
  }
}*/
