import 'package:festo_post/app_export.dart';

class SettingDrawer extends StatelessWidget {
  final DashboardProvider? dashboardProvider;

  const SettingDrawer({super.key, this.dashboardProvider});

  @override
  Widget build(BuildContext context) {
    DashboardProvider? provider = dashboardProvider!;
    return Theme(
      data: BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
      child: Drawer(
        //backgroundColor: ColorRef.backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  IconButton(onPressed: () => NavigationService.goBack(), icon: const Icon(Icons.arrow_back_ios_rounded, size: 20)),
                  Expanded(
                    child: Center(child: Text(StrRef.registerTitle2, style: TextStyle(fontFamily: 'Lato', fontSize: 20, color: ColorRef.textPrimaryColor))),
                  ),
                ],
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
                      trailing: Switch.adaptive(
                        inactiveThumbColor: ColorRef.blue0250A4,
                        thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return ColorRef.blue0250A4;
                          }
                          return ColorRef.blue3498DB;
                        }),
                        trackOutlineColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return ColorRef.transparent;
                          }
                          return ColorRef.transparent;
                        }),
                        activeTrackColor: ColorRef.black1E2A38,
                        focusColor: ColorRef.transparent,
                        inactiveTrackColor: ColorRef.greyE0E0E0,
                        value: provider.switchValue,
                        onChanged: (newValue) => provider.toggleTheme(switchVal: newValue),
                      ),
                      title: Text(item['label'], style: TextStyle(color: ColorRef.textPrimaryColor)),
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
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      ),
                      title: Text(item['label'], style: TextStyle(color: ColorRef.textPrimaryColor)),
                      onTap: () {},
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
