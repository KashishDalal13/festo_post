import 'package:festo_post/module/login_module/provider/register_provider.dart';
import 'package:festo_post/utils/colors.dart';
import 'package:festo_post/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ReferralView extends StatelessWidget {
  final RegisterProvider provider;

  const ReferralView({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => provider.onBack(), icon: const Icon(Icons.arrow_back_ios_rounded, size: 20)),
        centerTitle: true,
        title: Text(StrRef.referral, style: TextStyle(fontFamily: 'Lato', fontSize: 18, color: ColorRef.black202020)),
        actions: [
          GestureDetector(
            onTap: () =>provider.onSkipOrSubmit(),
            child: Container(
              padding: const EdgeInsets.only(right: 20),
              child: Text("Skip", style: TextStyle(color: ColorRef.blue0250A4, fontFamily: 'Lato', fontSize: 15)),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: StrRef.referralTittle,
              style: const TextStyle(fontSize: 20, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: StrRef.reward,
                  style: TextStyle(fontSize: 20, color: ColorRef.yellowFFA500),
                ),
              ],
            ),
          ),
          SvgPicture.asset(SvgPath.referral, height: width - 100),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorRef.greyEDEDED),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                hintText: StrRef.referralFormField,
                hintStyle: TextStyle(fontFamily: 'Lato', fontSize: 15, color: ColorRef.grey929292),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SvgPicture.asset(SvgPath.gift),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () =>provider.onSkipOrSubmit(),
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(color: ColorRef.yellowFFA500, borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              child: Text(
                StrRef.submit,
                style: TextStyle(color: ColorRef.black202020, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
