import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_export.dart';

class ReferralPoints extends StatelessWidget {
  const ReferralPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileProvider(),
      builder: (context, child) {
        ProfileProvider provider = context.watch<ProfileProvider>();
        return Theme(
          data: BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Column(
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0)),
                          color: ColorRef.yellowFFA500,
                        ),
                        alignment: Alignment.center,
                        child: Image.asset(
                          SvgPath.rewardBackground,
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => NavigationService.goBack(),
                                icon: Icon(Icons.arrow_back_ios_new_rounded,
                                    size: 24, color: ColorRef.black202020),
                              ),
                              const Spacer(),
                              Text(
                                StrRef.referralPoints,
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: ColorRef.black202020),
                              ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: ColorRef.whiteFFFFFF,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: BoolRef.themeChange
                                      ? ColorRef.transparent
                                      : ColorRef.greyD6D6D6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  SvgPath.medal,
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "150",
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: ColorRef.black202020,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "pts",
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      color: ColorRef.black202020,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                            SvgPath.rewardGift,
                            height: 157,
                            width: 158,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            child: Text(
                              textAlign: TextAlign.center,
                              StrRef.refferalText,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: ColorRef.black202020,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: ColorRef.yellowFFA500,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "EB1483",
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: ColorRef.black202020,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () => Clipboard.setData(
                                          const ClipboardData(text: "EB1483")),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Icon(
                                          Icons.copy_outlined,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: BoolRef.themeChange
                                      ? ColorRef.black1E2A38
                                      : ColorRef.whiteFFFFFF,
                                ),
                                child: SvgPicture.asset(
                                  SvgPath.share,
                                  height: 20,
                                  width: 20,
                                  color: BoolRef.themeChange
                                      ? ColorRef.whiteFFFFFF
                                      : ColorRef.black202020,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: provider.referralDetail.length,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: 5),
                        itemBuilder: (context, index) {
                          final item = provider.referralDetail[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            item["label"],
                                            style: TextStyle(
                                                color:
                                                    ColorRef.textPrimaryColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                fontFamily: 'Lato'),
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Text(
                                                item["date"],
                                                style: TextStyle(
                                                    color: BoolRef.themeChange
                                                        ? ColorRef.greyB0B0B0
                                                        : ColorRef.grey7B7B7B,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                    fontFamily: 'Lato'),
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                item["time"],
                                                style: TextStyle(
                                                    color: BoolRef.themeChange
                                                        ? ColorRef.greyB0B0B0
                                                        : ColorRef.grey7B7B7B,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                    fontFamily: 'Lato'),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      item["points"],
                                      style: TextStyle(
                                        color: item["points"].startsWith('+')
                                            ? ColorRef.green2A9442
                                            : ColorRef.redD94242,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                        fontFamily: 'Lato',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  thickness: 1,
                                  color: ColorRef.grey717171,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
