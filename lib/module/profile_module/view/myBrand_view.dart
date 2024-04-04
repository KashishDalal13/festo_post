import 'dart:ui';

import '../../../app_export.dart';

class MyBrandView extends StatelessWidget {
  const MyBrandView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileProvider(),
      builder: (context, child) {
        ProfileProvider provider = context.watch<ProfileProvider>();
        return Theme(
          data: BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => provider.onBack(),
                icon: Icon(Icons.arrow_back_ios_rounded,
                    size: width * 0.06, color: ColorRef.textPrimaryColor),
              ),
              centerTitle: true,
              title: Text(StrRef.myBrand,
                  style: TextStyle(fontFamily: 'Lato', fontSize: width * 0.05)),
            ),
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: height * 0.02),
                  padding: EdgeInsets.all(width * 0.025),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.04),
                    border: Border.all(color: ColorRef.greyD6D6D6),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: width * 0.025, vertical: width * 0.025),
                        padding: EdgeInsets.all(width * 0.025),
                        height: width * 0.2,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                          color: BoolRef.themeChange
                              ? ColorRef.white
                              : ColorRef.transparent,
                          borderRadius: BorderRadius.circular(width * 0.04),
                          border: Border.all(color: ColorRef.greyD6D6D6),
                        ),
                        child: Image.asset(SvgPath.logo),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: width * 0.025, vertical: width * 0.025),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StrRef.loopbots,
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Lato",
                                  color: ColorRef.textPrimaryColor),
                            ),
                            SizedBox(height: width * 0.01),
                            Text(StrRef.technology,
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Lato",
                                    color: BoolRef.themeChange
                                        ? ColorRef.whiteFFFFFF
                                        : ColorRef.grey494949)),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.025),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => NavigationService.routeToNamed(
                                  'brandDetails'),
                              child: SvgPicture.asset(
                                SvgPath.iconFrame,
                                height: width * 0.06,
                                width: width * 0.06,
                              ),
                            ),
                            SizedBox(height: width * 0.02),
                            GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5, sigmaY: 5),
                                        child: AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      width * 0.05)),
                                          backgroundColor: BoolRef.themeChange
                                              ? ColorRef.black1E2A38
                                              : ColorRef.whiteFFFFFF,
                                          surfaceTintColor:
                                              ColorRef.whiteFFFFFF,
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(StrRef.delete,
                                                  style: TextStyle(
                                                      color: ColorRef
                                                          .textPrimaryColor,
                                                      fontFamily: 'Lato',
                                                      fontSize: width * 0.05,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: width * 0.01),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: width * 0.1),
                                                child: Text(StrRef.deleteSure,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: 'Lato',
                                                        fontSize: width * 0.04,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: BoolRef
                                                                .themeChange
                                                            ? ColorRef
                                                                .greyDFDFDF
                                                            : ColorRef
                                                                .grey757575)),
                                              ),
                                              SizedBox(height: width * 0.02),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () =>
                                                        NavigationService
                                                            .goBack(),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  width * 0.1,
                                                              vertical: width *
                                                                  0.025),
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  width * 0.01),
                                                      decoration: BoxDecoration(
                                                        color: BoolRef
                                                                .themeChange
                                                            ? ColorRef
                                                                .backgroundColor
                                                            : ColorRef
                                                                .greyE7E7E7,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    width *
                                                                        0.03),
                                                      ),
                                                      child: Text(StrRef.no,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Lato',
                                                              fontSize:
                                                                  width * 0.035,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: ColorRef
                                                                  .textPrimaryColor)),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                width * 0.1,
                                                            vertical:
                                                                width * 0.025),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                width * 0.01),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          ColorRef.yellowFFA500,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              width * 0.03),
                                                    ),
                                                    child: Text(StrRef.yes,
                                                        style: TextStyle(
                                                            fontFamily: 'Lato',
                                                            fontSize:
                                                                width * 0.035,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: ColorRef
                                                                .black202020)),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: SvgPicture.asset(SvgPath.trash,
                                    height: width * 0.06, width: width * 0.06)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: width * 0.08,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  child: GestureDetector(
                      onTap: () =>
                          NavigationService.routeToNamed('brandDetails'),
                      child: SvgPicture.asset(SvgPath.brandadd,
                          height: width * 0.2, width: width * 0.2)),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () =>
                      NavigationService.routeToNamed('SubscriptionPlan'),
                  child: Container(
                    height: height * 0.05,
                    margin: EdgeInsets.symmetric(
                        horizontal: width * 0.1, vertical: height * 0.05),
                    decoration: BoxDecoration(
                        color: ColorRef.yellowFFA500,
                        borderRadius: BorderRadius.circular(width * 0.03)),
                    alignment: Alignment.center,
                    child: Text(
                      StrRef.subscribe,
                      style: TextStyle(
                          color: ColorRef.black202020,
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lato'),
                    ),
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
