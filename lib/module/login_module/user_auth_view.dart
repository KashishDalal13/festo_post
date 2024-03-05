import 'package:festo_post/module/login_module/add_details_view.dart';
import 'package:festo_post/module/login_module/referral_view.dart';
import 'package:festo_post/module/login_module/register_provider.dart';
import 'package:festo_post/module/login_module/register_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';
import 'package:pinput/pinput.dart';

import '../../utils/string.dart';
import 'otp_view.dart';

class UserAuthView extends StatelessWidget {
  const UserAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (BuildContext context) => RegisterProvider(),
      builder: (context, child) {
        RegisterProvider provider = context.watch<RegisterProvider>();
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: IndexedStack(
              index: provider.introIndex,
              children: [
                RegisterView(provider: provider),
                OtpView(provider: provider),
                ReferralView(provider: provider),
                AddDetails(provider: provider),
              ],
            ),
          ),
        );
      },
    );
  }
}
