import 'package:festo_post/app_export.dart';

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
                  child: TextButton(
                    onPressed: () => provider.onSkip(),
                    child: Text(
                      provider.introIndex == 2 ? "" : StrRef.skip,
                      style: TextStyle(color: BoolRef.themeChange ? ColorRef.white : ColorRef.grey5c5c5c, fontSize: 15, fontFamily: 'Lato'),
                    ),
                  ),
                ),
                Container(
                  // color: Colors.yellow,
                  margin: const EdgeInsets.only(top: 150), // flex: 6,
                  height: height / 2.4,
                  child: PageView(
                    controller: provider.pageController,
                    onPageChanged: (index) => provider.onIndexChange(index: index),
                    children: provider.items.map((e) {
                      OnBoardingInfo data = e;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(data.image, height: width - 225),
                          const SizedBox(height: 15),
                          Text(data.title,
                              style: TextStyle(fontSize: 25, color: BoolRef.themeChange ? ColorRef.white : ColorRef.black202020, fontWeight: FontWeight.bold, fontFamily: 'Lato')),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 45),
                            child: Text(data.descriptions,
                                style: TextStyle(color: BoolRef.themeChange ? ColorRef.white : ColorRef.grey5c5c5c, fontSize: 15, fontFamily: 'Lato'), textAlign: TextAlign.center),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SmoothPageIndicator(
                    controller: provider.pageController,
                    count: provider.items.length,
                    effect: ExpandingDotsEffect(activeDotColor: ColorRef.yellowFFA500, dotColor: ColorRef.white898989, spacing: 3, dotHeight: 5, dotWidth: 10, expansionFactor: 2),
                  ),
                ),
              ],
            ),
            floatingActionButton: provider.introIndex == 2
                ? GestureDetector(
                    onTap: () => provider.getStarted(),
                    child: Stack(
                      alignment: const Alignment(1, 0.65),
                      children: [
                        Transform.translate(
                          offset: const Offset(60, 50),
                          child: Transform.rotate(
                            angle: 0.80,
                            child: Container(
                              height: 160,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                color: ColorRef.yellowFFA500,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          StrRef.getStart,
                          style: TextStyle(fontSize: 18, fontFamily: 'Lato', fontWeight: FontWeight.w600, color: ColorRef.black202020),
                        )
                      ],
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
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(28), color: ColorRef.yellowFFA500),
                          ),
                        ),
                        Icon(Icons.arrow_forward_rounded, color: ColorRef.black202020)
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
