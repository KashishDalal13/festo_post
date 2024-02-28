import 'package:festo_post/OnBoarding/on_BoardingItems.dart';
import 'package:festo_post/OnBoarding/onboarding_provider.dart';
import 'package:festo_post/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingItems();
    final pageController = PageController();
    //comment
    double width = MediaQuery.of(context).size.width;
    bool isLastPage = false;
    return ChangeNotifierProvider(
      create: (BuildContext context) => IntroProvider(),
      builder: (context, child) {
        IntroProvider provider = context.watch<IntroProvider>();
        return Scaffold(
          bottomSheet: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: isLastPage
                ? getStarted(width: width)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // skip button
                      TextButton(
                        onPressed: () => pageController
                            .jumpToPage(controller.items.length - 1),
                        child: Text("Skip"),
                      ),

                      // Indicator
                      SmoothPageIndicator(
                        controller: pageController,
                        count: controller.items.length,
                        onDotClicked: (index) => pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeIn),
                        effect: const WormEffect(activeDotColor: Colors.purple),
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
                itemCount: controller.items.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(controller.items[index].image),
                      const SizedBox(height: 15),
                      Text(
                        controller.items[index].title,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        controller.items[index].descriptions,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 17),
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
