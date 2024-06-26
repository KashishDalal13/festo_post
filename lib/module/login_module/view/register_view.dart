import 'dart:ffi';

import 'package:festo_post/app_export.dart';

class RegisterView extends StatelessWidget {
  final RegisterProvider provider;

  const RegisterView({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StrRef.registerTitle1,
              style: TextStyle(fontSize: 25, color: ColorRef.textPrimaryColor, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
            ),
            Text(
              StrRef.registerTitle2,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Lato', color: ColorRef.yellowFFA500),
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 10), child: SvgPicture.asset(SvgPath.registerImg1, height: width - 150)),
        Text(provider.toggleLoginOrRegister ? StrRef.login : StrRef.register, style: TextStyle(fontSize: 20, color: ColorRef.textPrimaryColor)),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorRef.backgroundColor),
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            controller: provider.phoneController,
            style: TextStyle(fontFamily: 'Lato', fontSize: 15, color: ColorRef.textPrimaryColor),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
            decoration: InputDecoration(
              constraints: const BoxConstraints(maxHeight: 45),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              hintText: StrRef.contact,
              prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SvgPicture.asset(SvgPath.phone, colorFilter: ColorFilter.mode(ColorRef.textPrimaryColor!, BlendMode.srcIn))),
              hintStyle: TextStyle(fontFamily: 'Lato', fontSize: 15, color: BoolRef.themeChange ? ColorRef.greyC5C5C5 : ColorRef.grey929292),
              border: InputBorder.none,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => provider.onVerify(),
          child: Container(
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
            decoration: BoxDecoration(color: ColorRef.yellowFFA500, borderRadius: BorderRadius.circular(15)),
            alignment: Alignment.center,
            child: Text(
              StrRef.verify,
              style: TextStyle(color: ColorRef.black202020, fontSize: 15, fontWeight: FontWeight.w600, fontFamily: 'Lato'),
            ),
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => provider.onVerify(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(StrRef.whatsApp, style: TextStyle(fontSize: 15, color: ColorRef.textPrimaryColor, fontWeight: FontWeight.normal, fontFamily: 'Lato')),
              const SizedBox(width: 5),
              Text(StrRef.sms, style: TextStyle(color: ColorRef.yellowFFA500, fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Lato')),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => provider.onToggleLoginOrRegister(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(provider.toggleLoginOrRegister ? StrRef.accountNotExists : StrRef.accountExists,
                  style: TextStyle(fontSize: 15, color: ColorRef.textPrimaryColor, fontWeight: FontWeight.normal, fontFamily: 'Lato')),
              const SizedBox(width: 5),
              Text(provider.toggleLoginOrRegister ? StrRef.register : StrRef.login,
                  style: TextStyle(color: ColorRef.blue0250A4, fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Lato')),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
