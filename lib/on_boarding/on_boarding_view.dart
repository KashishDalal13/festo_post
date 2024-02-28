import 'package:festo_post/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
        return Scaffold(
          bottomSheet: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // skip button
                TextButton(
                  onPressed: () => provider.onSkip(),
                  child: const Text("Skip"),
                ),
                // Indicator
                SmoothPageIndicator(
                  controller: provider.pageController,
                  count: provider.items.length,
                  onDotClicked: (index) => provider.pageController.animateToPage(index, duration: const Duration(milliseconds: 600), curve: Curves.easeIn),
                  effect: const WormEffect(activeDotColor: Colors.purple,dotHeight: 10,dotWidth: 20),
                ),
                // next button
                TextButton(
                  onPressed: () => provider.onNext(),
                  child: const Text("Next"),
                ),
              ],
            ),
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: PageView.builder(
                // onPageChanged: (index)=> setState((){}),
                itemCount: provider.items.length,
                controller: provider.pageController,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(provider.items[index].image),
                      const SizedBox(height: 15),
                      Text(
                        provider.items[index].title,
                        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        provider.items[index].descriptions,
                        style: const TextStyle(color: Colors.grey, fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                }),
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
