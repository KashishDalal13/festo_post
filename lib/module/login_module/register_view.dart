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
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return ChangeNotifierProvider(
        create: (BuildContext context) => RegisterProvider(),
        builder: (context, child) {
          // ThemeSettings settings = context.watch<ThemeSettings>();
          RegisterProvider provider = context.watch<RegisterProvider>();
          return SafeArea(
              child: Scaffold(
                body: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 150), // flex: 6,
                      height: height / 1.8,
                      child: PageView(
                          controller: provider.pageController,
                          onPageChanged: (index) =>
                              provider.onIndexChange(index: index),
                          children: provider.items.map((e) {
                            RegisterInfo data = e;
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data.title,
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: ColorRef.black202020,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato'),
                                  ), const Text("  "),
                                  Text(
                                    data.title2,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato',
                                        color: ColorRef.yellowFFA500),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              SvgPicture.asset(data.image, height: width - 200),
                              const SizedBox(height: 15),
                              Text(data.descriptions,
                                  style: TextStyle(
                                      color: ColorRef.black202020,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato'),
                                  textAlign: TextAlign.center),
                              const SizedBox(height: 15),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200], // Grey background color
                                        borderRadius: BorderRadius.circular(20), // Rounded corners
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Adjust padding
                                          hintText: StrRef.contact,
                                          hintStyle: TextStyle(fontFamily: 'Lato',fontSize: 20,color: ColorRef.grey929292),
                                          prefixIcon: const Icon(Icons.phone), // Icon added here
                                          border: InputBorder.none, // Remove border
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    // Button added here
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle button press
                                      },
                                      style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(Size.fromWidth(45)),
                                        // padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 85,vertical: 3)),
                                        backgroundColor: MaterialStateProperty.all<Color>(ColorRef.yellowFFA500), // Button background color
                                        shape: MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20), // Rounded corners
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        StrRef.verify,
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: ColorRef.black202020, // Button text color
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
}
