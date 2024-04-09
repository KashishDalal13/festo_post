
import 'package:festo_post/app_export.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
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
                    size: 20, color: ColorRef.textPrimaryColor),
              ),
              centerTitle: true,
              title: Text(StrRef.payment,
                  style: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
            resizeToAvoidBottomInset: false,
            body: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: BoolRef.themeChange
                                      ? ColorRef.transparent
                                      : ColorRef.greyCACACA),
                              color: BoolRef.themeChange
                                  ? ColorRef.backgroundColor
                                  : ColorRef.whiteFFFFFF,
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text(
                                  "1",
                                  style: TextStyle(
                                      color: ColorRef.textPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      fontFamily: 'Lato'),
                                ),
                                SvgPicture.asset(
                                  SvgPath.ribbon,
                                  width: 60,
                                ),
                                Text(
                                  StrRef.subscript,
                                  style: TextStyle(
                                      color: ColorRef.textPrimaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25,
                                      fontFamily: 'Lato'),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ApplyCouponView(provider: provider);
                                },
                              );
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: BoolRef.themeChange
                                        ? ColorRef.transparent
                                        : ColorRef.greyCACACA),
                                color: BoolRef.themeChange
                                    ? ColorRef.backgroundColor
                                    : ColorRef.whiteFFFFFF,
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  SvgPicture.asset(SvgPath.coupon),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    StrRef.applyCoupon,
                                    style: TextStyle(
                                        color: ColorRef.textPrimaryColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        fontFamily: 'Lato'),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Icon(Icons.arrow_forward_ios_rounded,
                                        size: 20,
                                        color: ColorRef.textPrimaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: BoolRef.themeChange
                                        ? ColorRef.transparent
                                        : ColorRef.greyCACACA),
                                color: BoolRef.themeChange
                                    ? ColorRef.backgroundColor
                                    : ColorRef.whiteFFFFFF,
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  const SizedBox(width: 15),
                                  Transform.scale(
                                    scale: 1.4,
                                    child: Checkbox(
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        isChecked = true;
                                      },
                                    ),
                                  ),
                                  // Checkbox(
                                  //   value: isChecked,
                                  //   onChanged: (bool? newValue) {
                                  //       setState(() {
                                  //         provider.setSelectedFontFamily(fontFamily);
                                  //         stackBoardItem.textStyle=TextStyle(fontFamily: fontFamily);
                                  //         provider.onBack();
                                  //       });
                                  //
                                  //   },
                                  //   activeColor: ColorRef.blue1E75E5,
                                  // ),
                                  const SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        StrRef.userReferral,
                                        style: TextStyle(
                                            color: ColorRef.textPrimaryColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            fontFamily: 'Lato'),
                                      ),
                                      Text(
                                        StrRef.availablePoints,
                                        style: TextStyle(
                                            color: ColorRef.textPrimaryColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            fontFamily: 'Lato'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                    thickness: 1,
                                    color: ColorRef.grey717171,
                                    indent: 20,
                                    endIndent: 10),
                              ),
                              Text(
                                StrRef.priceDetails,
                                style: TextStyle(
                                    color: ColorRef.textPrimaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    fontFamily: 'Lato'),
                              ),
                              Expanded(
                                child: Divider(
                                    thickness: 1,
                                    color: ColorRef.grey717171,
                                    indent: 10,
                                    endIndent: 15),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: ColorRef.greyCACACA),
                              color: ColorRef.transparent,
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        StrRef.subscriptAmt,
                                        style: TextStyle(
                                            color: ColorRef.textPrimaryColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            fontFamily: 'Lato'),
                                      ),
                                    ),
                                    Text(
                                      "₹999.00",
                                      style: TextStyle(
                                          color: ColorRef.textPrimaryColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          fontFamily: 'Lato'),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        StrRef.gst,
                                        style: TextStyle(
                                            color: ColorRef.textPrimaryColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            fontFamily: 'Lato'),
                                      ),
                                    ),
                                    Text(
                                      "+ ₹71.82",
                                      style: TextStyle(
                                          color: ColorRef.textPrimaryColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          fontFamily: 'Lato'),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                    thickness: 1,
                                    color: ColorRef.grey717171,
                                    indent: 0.5,
                                    endIndent: 0.5),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        StrRef.payableAmt,
                                        style: TextStyle(
                                            color: ColorRef.textPrimaryColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            fontFamily: 'Lato'),
                                      ),
                                    ),
                                    Text(
                                      "₹1070.82",
                                      style: TextStyle(
                                          color: ColorRef.blue3498DB,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          fontFamily: 'Lato'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () =>
                                NavigationService.routeToNamed('finalPayment'),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 35),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorRef.yellowFFA500,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                StrRef.payNow,
                                style: TextStyle(
                                    color: ColorRef.black202020,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    fontFamily: 'Lato'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
