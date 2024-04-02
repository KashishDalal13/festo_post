import 'package:flutter/cupertino.dart';

import '../../../app_export.dart';

class ReferralPoints extends StatelessWidget {
  const ReferralPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
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
                      child: Image.asset(SvgPath.rewardBackground,),
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
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Text(
                              textAlign: TextAlign.center,
                              StrRef.refferalText,style: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: ColorRef.black202020,
                          ),),
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
                                        padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                              child: SvgPicture.asset(SvgPath.share,height: 20,width: 20,color: BoolRef.themeChange?ColorRef.whiteFFFFFF:ColorRef.black202020,),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: const Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Debited for subscribing brand “ABC Company”."),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text("30 Mar,2024"),
                                  SizedBox(width: 15,),
                                  Text("12:25 PM")
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Text("-1 pts"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                          thickness: 1,
                          color: ColorRef.grey717171,
                          ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
