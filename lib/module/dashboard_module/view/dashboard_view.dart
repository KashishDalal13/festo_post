import 'package:carousel_slider/carousel_slider.dart';
import 'package:festo_post/utils/bool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../provider/dashboard_provider.dart';

class dashboardView extends StatelessWidget {
  const dashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int _current = 0;
    final List<String> imgList = [
      'https://example.com/image1.jpg',
      'https://example.com/image2.jpg',
      'https://example.com/image3.jpg',
      // Add more image URLs as needed
    ];
    final CarouselController _controller = CarouselController();
    return ChangeNotifierProvider(
      create: (BuildContext context) => DashboardProvider(),
      builder: (context, child) {
        DashboardProvider provider = context.watch<DashboardProvider>();
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  size: 24,
                  color: BoolRef.themeChange
                      ? ColorRef.white
                      : ColorRef.black202020,
                ),
              ),
              centerTitle: true,
              title: Text(
                StrRef.registerTitle2,
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    // Add your onPressed action here
                  },
                  icon: SvgPicture.asset(
                    SvgPath.profile,
                    width: 24, // Customize width as needed
                    height: 24, // Customize height as needed
                  ),
                ),
              ],
            ),
            resizeToAvoidBottomInset: false,
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                CarouselSlider(
                  items: imgList
                      .map((url) => Image.asset(SvgPath.carousel))
                      .toList(),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      provider.onPageChanged(index);
                    },
                    initialPage: 0,
                    enlargeFactor: 0.3,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    height: 180,
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.map((url) {
                    int index = imgList.indexOf(url);
                    return Container(
                      width: 8,
                      height: 8,
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == provider.current
                            ? ColorRef.yellowFFA500
                            : ColorRef.greyEDEDED,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StrRef.upcomingEvents,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Lato',
                          fontSize: 16),
                    ),
                    Text(
                      StrRef.viewAll,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Lato',
                          fontSize: 13,
                          color: ColorRef.blue0250A4),
                    ),
                  ],
                ),
                // const SizedBox(height: 15),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: provider.addDate.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              provider.onSelectDate(index: index);
                            },
                            child: Container(
                              height: 30,
                              width: 60,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: index == provider.eventIndex
                                    ? ColorRef.yellowFFA500
                                    : ColorRef.yellowFFEDCC,
                              ),
                              child: Center(
                                child: Text(
                                  provider.addDate[index]['label'],
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(height: 15),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    ...provider.addDate[provider.eventIndex]['imageList']
                        .map(
                          (e) => Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.asset(e)),
                        )
                        .toList(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1, // Adjust thickness as needed
                        color: ColorRef.grey717171, // Adjust color as needed
                      ),
                    ),
                    Text(
                      StrRef.todayEvent,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Lato',
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 10), // Adjust the width as needed
                    Expanded(
                      child: Divider(
                        thickness: 1, // Adjust thickness as needed
                        color: ColorRef.grey717171, // Adjust color as needed
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: provider.addTodayEvent.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                provider.addTodayEvent[index]['label'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Lato',
                                    color: ColorRef.brownBE7B00,
                                    fontSize: 15),
                              ),
                              Text(
                                StrRef.viewAll,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Lato',
                                    fontSize: 13,
                                    color: ColorRef.blue0250A4),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              ...provider.addTodayEvent[index]
                                      ['imageList']
                                  .map(
                                    (e) => Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Image.asset(e)),
                                  )
                                  .toList(),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
