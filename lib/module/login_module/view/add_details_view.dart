import 'package:festo_post/module/login_module/provider/register_provider.dart';
import 'package:festo_post/utils/bool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/colors.dart';
import '../../../utils/string.dart';

class AddDetails extends StatelessWidget {
  final RegisterProvider provider;

  const AddDetails({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: () => provider.onBack(), icon: const Icon(Icons.arrow_back_ios_rounded, size: 20)),
          centerTitle: true,
          title: Text(StrRef.addDetails, style: TextStyle(fontFamily: 'Lato', fontSize: 18, color: ColorRef.black202020))),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => print("upload"),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorRef.greyEDEDED,
                ),
                child: Icon(
                  Icons.add,
                  color: ColorRef.blue0250A4,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(StrRef.uploadPNG, style: const TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w400, fontSize: 13)),
            const SizedBox(height: 10),
            Flexible(
              child: ListView.builder(
                itemCount: provider.addDetail.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorRef.commonBgColor),
                    child: TextFormField(
                      controller: provider.addDetail[index]['controller'],
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        hintText: provider.addDetail[index]['label'],
                        hintStyle: TextStyle(fontFamily: 'Lato', fontSize: 15, color: BoolRef.themeChange ? ColorRef.greyC5C5C5 : ColorRef.grey929292),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SvgPicture.asset(provider.addDetail[index]['svg']),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () => provider.onSkipOrSubmit(),
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
      ),
    );
  }
}
