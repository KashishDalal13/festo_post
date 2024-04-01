import 'dart:ui';

import '../../../app_export.dart';

class ApplyCouponView extends StatefulWidget {
  final ProfileProvider? provider;
  const ApplyCouponView( {super.key, this.provider});

  @override
  State<ApplyCouponView> createState() => _ApplyCouponViewState();
}

class _ApplyCouponViewState extends State<ApplyCouponView> {
  @override
  Widget build(BuildContext context) {
    ProfileProvider? provider = widget.provider!;
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        // Adjust blur intensity as needed
        child: SizedBox(
          height: MediaQuery.of(context).size.width * 0.8,
          width: MediaQuery.of(context).size.width * 0.1,
          child: Container(
            margin: const EdgeInsets.all(1),
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            decoration: BoxDecoration(
              color: BoolRef.themeChange
                  ? ColorRef.blue1E2A38
                  : ColorRef.whiteFFFFFF,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(50),
                        color: BoolRef.themeChange
                            ? ColorRef.blue304359
                            : ColorRef.greyEDEDED,
                      ),
                      child: IconButton(
                        alignment: Alignment.center,
                        onPressed: () => provider.onBack(),
                        icon: Icon(
                          Icons.close,
                          size: 20,
                          color: BoolRef.themeChange
                              ? ColorRef.yellowFFA500
                              : ColorRef.blue0250A4,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Image.asset(SvgPath.availableCoupon),
                const SizedBox(height: 15),
                Text(
                  StrRef.availableCoupon,
                  style: TextStyle(
                      color: ColorRef.textPrimaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      fontFamily: 'Lato'),
                ),
                const SizedBox(height: 20,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: BoolRef.themeChange
                            ? ColorRef.transparent
                            : ColorRef.greyCACACA),
                    color: ColorRef.backgroundColor,
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset(SvgPath.coupon),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            StrRef.welcomeCoupon,
                            style: TextStyle(
                                color: ColorRef.textPrimaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                fontFamily: 'Lato'),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.arrow_forward_ios_rounded,
                                size: 20, color: ColorRef.textPrimaryColor),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset(SvgPath.coupon),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            StrRef.discountCoupon,
                            style: TextStyle(
                                color: ColorRef.textPrimaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                fontFamily: 'Lato'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset(SvgPath.coupon),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            StrRef.festiveCoupon,
                            style: TextStyle(
                                color: ColorRef.textPrimaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                fontFamily: 'Lato'),
                          ),
                        ],
                      )
                    ],
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
