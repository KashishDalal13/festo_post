import 'package:festo_post/module/login_module/provider/register_provider.dart';
import 'package:festo_post/module/setting_module/provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../../utils/string.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (BuildContext context) => SettingProvider(),
      builder: (context, child) {
        SettingProvider provider = context.watch<SettingProvider>();
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => provider.onBack(context),
              icon: const Icon(Icons.arrow_back_ios_rounded, size: 20),
            ),
            centerTitle: true,
            title: Text(
              StrRef.registerTitle2,
              style: const TextStyle(
                fontFamily: 'Lato',
                fontSize: 20,
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: Center(
            child: ListView.builder(
              itemCount: provider.settingDetails.length, // Specify the number of items
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: ColorRef.greyD6D6D6),
                  ),
                  child: ListTile(
                    leading: SvgPicture.asset(provider.settingDetails[index]['icon']),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,size: 20,),
                    title: Text(provider.settingDetails[index]['label']), // Generate dynamic titles
                    onTap: () {
                      // debugPrint("hii");
                    },
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
