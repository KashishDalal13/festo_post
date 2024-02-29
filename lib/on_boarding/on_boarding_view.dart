
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
        IntroProvider provider = context.watch<IntroProvider>();
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child:  TextButton(onPressed: () => provider.onSkip(),
                      child: Text( provider.introIndex == 2?"":"Skip", style: TextStyle(
                          color: AppColors.grey5c5c5c,
                          fontSize: 15,
                          fontFamily: 'Lato'))),
                ),
                Container(
                    // color: Colors.yellow,
                    margin: const EdgeInsets.only(top: 150),// flex: 6,
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
                                SvgPicture.asset(
                                    data.image, height: width - 200),
                                const SizedBox(height: 15),
                                Text(data.title, style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Lato')),
                                const SizedBox(height: 15),
                                Text(data.descriptions, style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontFamily: 'Lato'),
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          );
                        }).toList())),
                Align(
                  alignment: Alignment.topCenter,
                  child: SmoothPageIndicator(
                    controller: provider.pageController,
                    count: provider.items.length,
                    effect: ExpandingDotsEffect(
                        activeDotColor: AppColors.yellowFFA500,
                        dotColor: AppColors.white898989,
                        spacing: 3,
                        dotHeight: 5,
                        dotWidth: 10,
                        expansionFactor: 2),
                  ),
                ),
              ],
            ),
            floatingActionButton: provider.introIndex==2?const SizedBox(): TextButton(
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
                        color: AppColors.yellowFFA500,
                      ),
                    ),
                  ),
                  Icon(
                      Icons.arrow_forward_rounded, color: AppColors.black202020)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Get Started Button
  Widget getStarted({required double width}) {
    return Container(
      decoration: BoxDecoration(color: AppColors.yellowFFA500),
      width: width * .9,
      height: 55,
      child: TextButton(
        onPressed: () {},
        child: const Text("Get Started", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
