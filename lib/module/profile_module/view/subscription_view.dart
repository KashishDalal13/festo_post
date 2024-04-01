import 'package:festo_post/utils/bool.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../app_export.dart';

class SubscriptionPlanView extends StatelessWidget {
  const SubscriptionPlanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileProvider(),
      builder: (context, child) {
        final provider = context.watch<ProfileProvider>();

        return SafeArea(
          child: Theme(
            data: BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
            child: Scaffold(
              body:  Stack(
                children: [
                // Background image
                Image.asset(
                BoolRef.themeChange?SvgPath.subscriptionDark:SvgPath.subscription,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => provider.onBack(),
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 20,
                          color: ColorRef.textPrimaryColor,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        StrRef.selectPlan,
                        style: TextStyle(fontFamily: 'Lato', fontSize: 20,color: ColorRef.textPrimaryColor,),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 114  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height:450,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.subscription.length,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(width: 20),
                          itemBuilder: (context, index) {
                            final item = provider.subscription[index];
                            return Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.7),
                                    spreadRadius: 2,
                                     blurRadius: 7,
                                    offset: const Offset(0,0),
                                  ),
                                ],
                                color: ColorRef.whiteFFFFFF,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 250,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        item["title"],
                                        style: TextStyle(
                                            color: ColorRef.black202020,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Lato'),
                                      ),
                                      const SizedBox(height: 15,),
                                      Text(
                                    item["offer"],
                                    style: TextStyle(
                                        color: ColorRef.yellowFFA500,
                                        fontSize: 35,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins'),
                                  ),
                                      const SizedBox(height: 15,),
                                      Text(
                                    item["actualRupees"],
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                        decorationColor: ColorRef.redE00303,
                                        color: ColorRef.redE00303,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Poppins'),
                                  ),
                                      const SizedBox(height: 15,),
                                    ],
                                  ),
                                  const SizedBox(height: 15,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: '\u2022 ', // Unicode character for bullet point
                                            style: TextStyle(color: ColorRef.black202020,fontSize: 20,fontWeight: FontWeight.bold),
                                            children: [
                                              TextSpan(
                                                text: item["offerDetails1"],
                                                style: TextStyle(
                                                  color: ColorRef.black202020,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        RichText(
                                          text: TextSpan(
                                            text: '\u2022 ', // Unicode character for bullet point
                                            style: TextStyle(color: ColorRef.black202020,fontSize: 20,fontWeight: FontWeight.bold),
                                            children: [
                                              TextSpan(
                                                text: item["offerDetails2"],
                                                style: TextStyle(
                                                  color: ColorRef.black202020,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        RichText(
                                          text: TextSpan(
                                            text: '\u2022 ', // Unicode character for bullet point
                                            style: TextStyle(color: ColorRef.black202020,fontSize: 20,fontWeight: FontWeight.bold),
                                            children: [
                                              TextSpan(
                                                text: item["offerDetails3"],
                                                style: TextStyle(
                                                  color: ColorRef.black202020,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        RichText(
                                          text: TextSpan(
                                            text: '\u2022 ', // Unicode character for bullet point
                                            style: TextStyle(color: ColorRef.black202020,fontSize: 20,fontWeight: FontWeight.bold),
                                            children: [
                                              TextSpan(
                                                text: item["offerDetails4"],
                                                style: TextStyle(
                                                  color: ColorRef.black202020,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        GestureDetector(
                                          onTap: () => NavigationService.routeToNamed('payment'),
                                          child: Container(
                                            height: 40,
                                            margin: const EdgeInsets.symmetric(horizontal: 30),
                                            decoration: BoxDecoration(
                                              color: ColorRef.yellowFFA500,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              StrRef.Continue,
                                              style: TextStyle(
                                                color: ColorRef.black202020,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Lato',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),


                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ]
              ),
            ),
          ),
        );
      },
    );
  }
}
