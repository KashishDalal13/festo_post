import 'package:festo_post/utils/colors.dart';
import 'package:festo_post/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../theme_change/theme_settings.dart';
import 'on_boarding_info.dart';
import 'onboarding_provider.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (BuildContext context) => IntroProvider(),
      builder: (context, child) {
        ThemeSettings settings = context.watch<ThemeSettings>();
        IntroProvider provider = context.watch<IntroProvider>();
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Row(
                  children: [
                    Switch(
                      value: settings.switchValue,
                      onChanged: (newValue) {
                        // provider.toggleTheme(val: newValue);
                        settings.toggleTheme(switchVal: newValue);
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => provider.onSkip(),
                        child: Text(
                          provider.introIndex == 2 ? "" : StrRef.skip,
                          style: TextStyle(
                              color: ColorRef.grey5c5c5c,
                              fontSize: 15,
                              fontFamily: 'Lato'),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  // color: Colors.yellow,
                  margin: const EdgeInsets.only(top: 150), // flex: 6,
                  height: height / 2.4,
                  child: PageView(
                    controller: provider.pageController,
                    onPageChanged: (index) =>
                        provider.onIndexChange(index: index),
                    children: provider.items.map((e) {
                      OnBoardingInfo data = e;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(data.image, height: width - 225),
                            const SizedBox(height: 15),
                            Text(data.title,
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Lato')),
                            const SizedBox(height: 15),
                            Text(data.descriptions,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: 'Lato'),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SmoothPageIndicator(
                    controller: provider.pageController,
                    count: provider.items.length,
                    effect: ExpandingDotsEffect(
                        activeDotColor: ColorRef.yellowFFA500,
                        dotColor: ColorRef.white898989,
                        spacing: 3,
                        dotHeight: 5,
                        dotWidth: 10,
                        expansionFactor: 2),
                  ),
                ),
              ],
            ),
            floatingActionButton: provider.introIndex == 2
                ? Align(
                    heightFactor: 0.3,
                    widthFactor: 0.1,
                    child: GestureDetector(
                      onTap: () {
                        provider.getstarted(context);
                      },
                      child: Container(
                        child: Stack(
                          alignment: const Alignment(-0.6, -0.3),
                          children: [
                            Transform.rotate(
                              angle: 0.80,
                              child: Container(
                                height: 168,
                                width: 168,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: ColorRef.yellowFFA500,
                                ),
                              ),
                            ),
                            Text(
                              StrRef.getStart,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                  color: ColorRef.black202020),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : TextButton(
                    onPressed: provider.onNext,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Transform.rotate(
                          angle: 0.8,
                          child: Container(
                            height: 68,
                            width: 68,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: ColorRef.yellowFFA500,
                            ),
                          ),
                        ),
                        Icon(Icons.arrow_forward_rounded,
                            color: ColorRef.black202020)
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}