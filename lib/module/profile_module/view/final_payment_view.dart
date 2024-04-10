
import 'package:festo_post/app_export.dart';

class FinalPayment extends StatelessWidget {
  const FinalPayment({super.key});

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
                    size: 20, color: ColorRef.textPrimaryColor),
              ),
              centerTitle: true,
              title: Text(StrRef.payment,
                  style: const TextStyle(fontFamily: 'Lato', fontSize: 20)),
            ),
            resizeToAvoidBottomInset: false,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: BoolRef.themeChange
                            ? ColorRef.transparent
                            : ColorRef.greyCACACA),
                    color: BoolRef.themeChange
                        ? ColorRef.blue304359
                        : ColorRef.containerBackgroundColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        StrRef.payableAmt,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            fontFamily: 'Lato',
                            color: ColorRef.textPrimaryColor),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "₹970.82",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            fontFamily: 'Lato',
                            color: ColorRef.blue3498DB),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                      StrRef.paymentMethod,
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
                  height: 15,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: provider.paymentMethod.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () => provider.onUPI(index),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: BoolRef.themeChange
                                      ? ColorRef.blue304359
                                      : ColorRef.transparent,
                                  border: Border.all(
                                      color: BoolRef.themeChange
                                          ? ColorRef.transparent
                                          : ColorRef.greyD6D6D6),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    leading: SvgPicture.asset(
                                      provider.paymentMethod[index]['icon'],
                                      height: 25,
                                      width: 25,
                                      colorFilter: ColorFilter.mode(
                                          ColorRef.textPrimaryColor!,
                                          BlendMode.srcIn),
                                    ),
                                    trailing: provider.isUPI && index == 2
                                        ? Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            size: 30,
                                            color: ColorRef.textPrimaryColor)
                                        : Icon(Icons.arrow_forward_ios_rounded,
                                            size: 20,
                                            color: ColorRef.textPrimaryColor),
                                    title: Text(
                                      provider.paymentMethod[index]['type'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Lato',
                                          color: ColorRef.textPrimaryColor,
                                          fontSize: 15),
                                    ),
                                  ),
                                  if (provider.isUPI && index == 2)
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                decoration: BoxDecoration(
                                                  color: ColorRef.whiteFFFFFF,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: BoolRef.themeChange
                                                          ? ColorRef.transparent
                                                          : ColorRef
                                                              .greyD6D6D6),
                                                ),
                                                child: SvgPicture.asset(
                                                  SvgPath.gPay,
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: ColorRef.whiteFFFFFF,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: BoolRef.themeChange
                                                          ? ColorRef.transparent
                                                          : ColorRef
                                                              .greyD6D6D6),
                                                ),
                                                child: SvgPicture.asset(
                                                  SvgPath.phonePe,
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: ColorRef.whiteFFFFFF,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: BoolRef.themeChange
                                                          ? ColorRef.transparent
                                                          : ColorRef
                                                              .greyD6D6D6),
                                                ),
                                                child: SvgPicture.asset(
                                                  SvgPath.paytm,
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 15),
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
