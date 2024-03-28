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
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  IconButton(onPressed: () => NavigationService.goBack(), icon: Icon(Icons.arrow_back_ios_rounded, size: 20, color: ColorRef.textPrimaryColor)),
                  Expanded(
                    child: Center(child: Text(StrRef.registerTitle2, style: TextStyle(fontFamily: 'Lato', fontSize: 20, color: ColorRef.textPrimaryColor))),
                  ),
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: provider.settingDetails.length,
              itemBuilder: (BuildContext context, int index) {
                final item = provider.settingDetails[index];
                return Container(
                  decoration: BoxDecoration(border: Border.all(color: BoolRef.themeChange ? ColorRef.transparent : ColorRef.greyD6D6D6), borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    leading: SvgPicture.asset(item['icon'], colorFilter: ColorFilter.mode(ColorRef.textPrimaryColor!, BlendMode.srcIn)),
                    trailing: item['label'] != StrRef.darkTheme
                        ? Icon(Icons.arrow_forward_ios_rounded, size: 20, color: ColorRef.textPrimaryColor)
                        : GestureDetector(
                            onTap: () => provider.toggleTheme(),
                            child: Container(
                              width: 40.0,
                              height: 20,
                              padding: const EdgeInsets.symmetric(horizontal: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: provider.switchValue ? ColorRef.blue1E2A38 : ColorRef.greyE0E0E0,
                              ),
                              child: AnimatedAlign(
                                alignment: provider.switchValue ? Alignment.centerRight : Alignment.centerLeft,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  width: 14.0,
                                  height: 14.0,
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: provider.switchValue ? ColorRef.blue3498DB : ColorRef.blue0250A4),
                                ),
                              ),
                            ),
                          ),
                    title: Text(item['label'], style: TextStyle(color: ColorRef.textPrimaryColor)),
                    onTap: () {},
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
            ),
          ],
        ),
      ),
    );
  }
}
