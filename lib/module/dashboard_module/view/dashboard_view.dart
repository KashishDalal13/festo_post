import 'package:festo_post/app_export.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (BuildContext context) => DashboardProvider(),
      builder: (context, child) {
        DashboardProvider provider = context.watch<DashboardProvider>();
        return Theme(
          data: BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
          child: Scaffold(
            appBar: AppBar(
              // leading: IconButton(
              //   onPressed: () => scaffoldKey.currentState?.openDrawer(),
              //   icon: Icon(Icons.menu, size: 24, color: ColorRef.textPrimaryColor),
              // ),
              centerTitle: true,
              title: Text(StrRef.registerTitle2, style: const TextStyle(fontSize: 20, fontFamily: 'Lato', fontWeight: FontWeight.w400)),
              actions: [
                IconButton(
                  onPressed: () => provider.onProfile(),
                  icon: SvgPicture.asset(SvgPath.profile, colorFilter: ColorFilter.mode(ColorRef.textPrimaryColor!, BlendMode.srcIn), width: 24, height: 24),
                ),
              ],
            ),
            resizeToAvoidBottomInset: false,
            body: ListView(
              children: [
                CarouselSlider(
                  items: provider.imgList
                      .map((url) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Image.asset(url), // Assuming url contains path to images
                          ))
                      .toList(),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) => provider.onPageChanged(index),
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    viewportFraction: 1,
                    height: 160,
                    padEnds: true,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: provider.imgList.map((url) {
                    int index = provider.imgList.indexOf(url);
                    return Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == provider.current ? ColorRef.yellowFFA500 : ColorRef.greyEDEDED,
                      ),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Divider(thickness: 1, color: ColorRef.grey717171, endIndent: 8)),
                            Text(StrRef.upcomingEvents, style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Lato', fontSize: 16, color: ColorRef.textPrimaryColor)),
                            Expanded(child: Divider(thickness: 1, color: ColorRef.grey717171, indent: 8)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemCount: provider.addDate.length,
                          itemBuilder: (BuildContext context, int index) {
                            Color unselectedColor = BoolRef.themeChange ? ColorRef.greyF9F9F9 : ColorRef.yellowFFEDCC;
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () => provider.onSelectDate(index: index),
                                  child: Container(
                                    height: 30,
                                    width: 60,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: index == provider.eventIndex ? ColorRef.yellowFFA500 : unselectedColor,
                                    ),
                                    child: Text(provider.addDate[index]['label']),
                                  ),
                                ),
                                // SizedBox(height: 15),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 5),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: provider.addDate[provider.eventIndex]['imageList'].length,
                            itemBuilder: (context, index) => Image.asset(provider.addDate[provider.eventIndex]['imageList'][index]),
                            separatorBuilder: (context, index) => const SizedBox(width: 5)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: Divider(thickness: 1, color: ColorRef.grey717171, endIndent: 8)),
                            Text(StrRef.todayEvent, style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Lato', fontSize: 16, color: ColorRef.textPrimaryColor)),
                            Expanded(child: Divider(thickness: 1, color: ColorRef.grey717171, indent: 8)),
                          ],
                        ),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: provider.addTodayEvent.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    provider.addTodayEvent[index]['label'],
                                    style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Lato', color: ColorRef.yellowFFA500, fontSize: 15),
                                  ),
                                  TextButton(
                                      style: const ButtonStyle(visualDensity: VisualDensity(vertical: -4, horizontal: -4)),
                                      onPressed: () => provider.onViewAll(context, index: index),
                                      child: Text(StrRef.viewAll,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Lato',
                                              fontSize: 13,
                                              color: BoolRef.themeChange ? ColorRef.blue3498DB : ColorRef.blue0250A4))),
                                ],
                              ),
                              Container(
                                height: 120,
                                margin: const EdgeInsets.only(top: 8, bottom: 10),
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: provider.addTodayEvent[index]['imageList'].length,
                                  itemBuilder: (context, innerIndex) => ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      provider.addTodayEvent[index]['imageList'][innerIndex],
                                      fit: BoxFit.cover, // Adjust image fit as needed
                                    ),
                                  ),
                                  separatorBuilder: (context, index) => const SizedBox(width: 8),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StrRef.trending,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Lato',
                              fontSize: 15,
                              color: ColorRef.textPrimaryColor,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              int selectedIndex = provider.trendingIndex; // Get the current index
                              provider.onViewAllTrending(context, index: selectedIndex); // Pass the current index
                            },
                            child: Text(
                              StrRef.viewAll,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Lato',
                                fontSize: 14,
                                color: BoolRef.themeChange ? ColorRef.blue3498DB : ColorRef.blue0250A4,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: provider.addTrendingEvent.length,
                          itemBuilder: (BuildContext context, int index) {
                            Color unselectedColor = BoolRef.themeChange ? ColorRef.greyF9F9F9 : ColorRef.yellowFFEDCC;
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    provider.onSelectTrending(index: index);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: index == provider.trendingIndex ? ColorRef.yellowFFA500 : unselectedColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        provider.addTrendingEvent[index]['label'],
                                      ),
                                    ),
                                  ),
                                ),
                                // SizedBox(height: 15),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 5);
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: provider.addTrendingEvent[provider.trendingIndex]['imageList'].length,
                            itemBuilder: (context, index) {
                              return Image.asset(provider.addTrendingEvent[provider.trendingIndex]['imageList'][index]);
                            },
                            separatorBuilder: (context, index) => const SizedBox(width: 15)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: Divider(thickness: 1, color: ColorRef.grey717171, endIndent: 8)),
                            Text(StrRef.seasonalOffers, style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Lato', fontSize: 16, color: ColorRef.textPrimaryColor)),
                            Expanded(child: Divider(thickness: 1, color: ColorRef.grey717171, indent: 10)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: provider.addSeasonOffers.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: width / 4.2,
                              child: Column(
                                children: [
                                  Image.asset(provider.addSeasonOffers[index]["imageList"], height: 70, width: 70),
                                  Text(
                                    provider.addSeasonOffers[index]["label"],
                                    style: TextStyle(fontFamily: 'Lato', fontSize: 14, color: ColorRef.textPrimaryColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 5),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: provider.addCategoryOffer.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    provider.addCategoryOffer[index]['label'],
                                    style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Lato', color: ColorRef.textPrimaryColor, fontSize: 15),
                                  ),
                                  TextButton(
                                    onPressed: () => provider.onViewAllOffer(context, index: index),
                                    child: Text(
                                      StrRef.viewAll,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 13, color: BoolRef.themeChange ? ColorRef.blue3498DB : ColorRef.blue0250A4),
                                    ),
                                  )
                                ],
                              ), //
                              SizedBox(
                                height: 110,
                                child: ListView.separated(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: provider.addCategoryOffer[index]['imageList'].length,
                                    itemBuilder: (context, innerIndex) => Image.asset(provider.addCategoryOffer[index]['imageList'][innerIndex]),
                                    separatorBuilder: (context, index) => const SizedBox(width: 10)),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // drawer: SettingDrawer(dashboardProvider: provider),
          ),
        );
      },
    );
  }
}
