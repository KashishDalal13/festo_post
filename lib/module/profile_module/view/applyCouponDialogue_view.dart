import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../../../app_export.dart';

class ApplyCouponView extends StatefulWidget {
  final ProfileProvider? provider;

  const ApplyCouponView({super.key, this.provider});

  @override
  State<ApplyCouponView> createState() => _ApplyCouponViewState();
}

class _ApplyCouponViewState extends State<ApplyCouponView> {
  @override
  Widget build(BuildContext context) {
    ProfileProvider? provider = widget.provider!;
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
            shadowColor: ColorRef.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                color: BoolRef.themeChange
                    ? ColorRef.blue1E2A38
                    : ColorRef.whiteFFFFFF,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: BoolRef.themeChange
                            ? ColorRef.blue304359
                            : ColorRef.greyEDEDED,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                        alignment: Alignment.center,
                        onPressed: () => provider.onBack(),
                        icon: Icon(
                          Icons.close,
                          size: 18,
                          color: BoolRef.themeChange
                              ? ColorRef.yellowFFA500
                              : ColorRef.blue0250A4,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
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
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: provider.availableCoupons.length,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        final item = provider.availableCoupons[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: BoolRef.themeChange
                                    ? ColorRef.transparent
                                    : ColorRef.greyCACACA),
                            color: BoolRef.themeChange? ColorRef.backgroundColor:ColorRef.containerBackgroundColor,
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                       item["offer"],
                                        style: TextStyle(
                                            color: ColorRef.textPrimaryColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            fontFamily: 'Lato'),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        item["offerCode"],
                                        style: TextStyle(
                                            color: BoolRef.themeChange
                                                ? ColorRef.greyEAEAEA
                                                : ColorRef.grey838383,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            fontFamily: 'Lato'),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        StrRef.apply,
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: BoolRef.themeChange
                                                ? ColorRef.yellowFFA500
                                                : ColorRef.blue0250A4),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
