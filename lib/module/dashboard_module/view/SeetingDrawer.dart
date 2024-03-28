import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../provider/dashboard_provider.dart';

class SettingDrawer extends StatefulWidget {
  final DashboardProvider? provider;
  const SettingDrawer({super.key,this.provider});

  @override
  State<SettingDrawer> createState() => _SettingDrawerState();
}

class _SettingDrawerState extends State<SettingDrawer> {
  @override
  Widget build(BuildContext context) {
    DashboardProvider? provider = widget.provider!;
    return Drawer(
      backgroundColor: ColorRef.whiteFFFFFF,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          AppBar(
            leading: IconButton(
              onPressed: () => provider.onBack(),
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
          ListView.builder(
            shrinkWrap: true,
            itemCount: provider.settingDetails.length,
            itemBuilder: (BuildContext context, int index) {
              final item = provider.settingDetails[index];
              if (item['label'] == StrRef.darkTheme) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: ColorRef.greyD6D6D6),
                  ),
                  child: ListTile(
                    leading: SvgPicture.asset(item['icon']),
                    trailing: Switch(
                      value: provider.switchValue,
                      onChanged: (newValue) {
                        provider.toggleTheme(switchVal: newValue);
                      },
                    ),
                    title: Text(item['label']),
                    onTap: () {},
                  ),
                );
              } else {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: ColorRef.greyD6D6D6),
                  ),
                  child: ListTile(
                    leading: SvgPicture.asset(item['icon']),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,size: 20,),
                    title: Text(item['label']),
                    onTap: () {},
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

