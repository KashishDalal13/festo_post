import 'package:festo_post/module/login_module/register_provider.dart';
import 'package:festo_post/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';

class RegisterView extends StatelessWidget {
  final RegisterProvider provider;
  const RegisterView({super.key,required this.provider});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StrRef.registerTitle1,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
            ),
            Text(
              StrRef.registerTitle2,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Lato', color: ColorRef.yellowFFA500),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SvgPicture.asset(SvgPath.registerImg1, height: width - 150),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorRef.greyEDEDED),
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            controller: provider.phoneController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
            decoration: InputDecoration(
              constraints: const BoxConstraints(maxHeight: 45),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              hintText: StrRef.contact,
              prefixIcon: const Icon(Icons.phone, size: 20),
              hintStyle: TextStyle(fontFamily: 'Lato', fontSize: 15, color: ColorRef.grey929292),
              border: InputBorder.none,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            //change index
            provider.onVerify();
          },
          child: Container(
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: ColorRef.yellowFFA500, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                StrRef.verify,
                style: TextStyle(color: ColorRef.black202020, fontSize: 15, fontWeight: FontWeight.w600, fontFamily: 'Lato'),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          //change index
          onTap: () => provider.onVerify(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provider.toggleWhatsAppOrSms ? StrRef.whatsApp : StrRef.whatsApp,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Lato'),
              ),
              const SizedBox(width: 5),
              Text(
                StrRef.sms,
                style: TextStyle(color: ColorRef.yellowFFA500, fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Lato'),
              ),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => provider.onToggleLoginOrRegister(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provider.toggleLoginOrRegister ? StrRef.accountNotExists : StrRef.accountExists,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Lato'),
              ),
              const SizedBox(width: 5),
              Text(
                provider.toggleLoginOrRegister ? StrRef.register : StrRef.login,
                style: TextStyle(color: ColorRef.blue0250A4, fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Lato'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
