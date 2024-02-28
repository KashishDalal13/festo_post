import 'package:festo_post/utils/colors.dart';
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
    return ChangeNotifierProvider(
      create: (BuildContext context) => IntroProvider(),
      builder: (context, child) {
        IntroProvider provider = context.watch<IntroProvider>();
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child:  provider.introIndex==2?SizedBox(): TextButton(onPressed: () => provider.onSkip(), child: const Text("Skip")),
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: PageView(
                        controller: provider.pageController,
                        onPageChanged: (index) => provider.onIndexChange(index: index),
                        children: provider.items.map((e) {
                          OnBoardingInfo data = e;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(data.image),
                              const SizedBox(height: 15),
                              Text(data.title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 15),
                              Text(data.descriptions, style: const TextStyle(color: Colors.grey, fontSize: 17), textAlign: TextAlign.center),
                            ],
                          );
                        }).toList())),
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SmoothPageIndicator(
                      controller: provider.pageController,
                      count: provider.items.length,
                      effect: ExpandingDotsEffect(activeDotColor: AppColors.yellowFFA500, spacing: 3, dotHeight: 5, dotWidth: 10, expansionFactor: 2),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () => provider.onNext(), child: const Text("Next"))),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // Get Started Button
  Widget getStarted({required double width}) {
    return Container(
      decoration: BoxDecoration(color: AppColors.purple),
      width: width * .9,
      height: 55,
      child: TextButton(
        onPressed: () {},
        child: const Text("Get Started", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
