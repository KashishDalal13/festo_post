import 'package:festo_post/app_export.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key});

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
                icon: Icon(Icons.arrow_back_ios_rounded, size: 20, color: ColorRef.textPrimaryColor),
              ),
              centerTitle: true,
              title: Text(StrRef.myAccount, style: const TextStyle(fontFamily: 'Lato', fontSize: 20)),
            ),
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.01),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: BoolRef.themeChange ? ColorRef.transparent : ColorRef.greyD6D6D6),
                    color: BoolRef.themeChange ? ColorRef.grey304359 : ColorRef.transparent,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                            padding: const EdgeInsets.all(10.0),
                            height: width * 0.2,
                            width: width * 0.2,
                            decoration: BoxDecoration(
                              color: BoolRef.themeChange ? ColorRef.white : ColorRef.transparent,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: ColorRef.greyD6D6D6),
                            ),
                            child: Image.asset(SvgPath.logo),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StrRef.loopbots,
                                  style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.w400, fontFamily: "Lato", color: ColorRef.textPrimaryColor),
                                ),
                                Text(StrRef.phnNo,
                                    style: TextStyle(
                                        fontSize: width * 0.04, fontWeight: FontWeight.w400, fontFamily: "Lato", color: BoolRef.themeChange ? ColorRef.whiteFFFFFF : ColorRef.blue0250A4)),
                              ],
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => provider.onTapEdit(),
                            child: SvgPicture.asset(
                              provider.isEdit ? SvgPath.cancelEdit : SvgPath.iconFrame,
                              height: width * 0.05,
                              width: width * 0.05,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (provider.isEdit)
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  hintText: StrRef.AddName,
                                  hintStyle: TextStyle(fontFamily: 'Lato', fontSize: width * 0.035, color: ColorRef.textPrimaryColor),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: SvgPicture.asset(SvgPath.profile, color: BoolRef.themeChange ? ColorRef.blue3498DB : ColorRef.blue0250A4),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  hintText: StrRef.AddPhone,
                                  fillColor: ColorRef.textPrimaryColor,
                                  hintStyle: TextStyle(fontFamily: 'Lato', fontSize: width * 0.035, color: ColorRef.textPrimaryColor),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: SvgPicture.asset(SvgPath.phone, color: BoolRef.themeChange ? ColorRef.blue3498DB : ColorRef.blue0250A4),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () => debugPrint("add"),
                              child: Container(
                                height: 40,
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(color: ColorRef.yellowFFA500, borderRadius: BorderRadius.circular(10)),
                                alignment: Alignment.center,
                                child: Text(
                                  StrRef.update,
                                  style: TextStyle(color: ColorRef.textPrimaryColor, fontSize: width * 0.035, fontWeight: FontWeight.w500, fontFamily: 'Lato'),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: provider.profileDetails.length,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration:
                        BoxDecoration(border: Border.all(color: BoolRef.themeChange ? ColorRef.transparent : ColorRef.greyD6D6D6), borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          leading: SvgPicture.asset(
                            provider.profileDetails[index]['icon'],
                            height: width * 0.04,
                            width: width * 0.04,
                            colorFilter: ColorFilter.mode(ColorRef.textPrimaryColor!, BlendMode.srcIn),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios_rounded, size: width * 0.04, color: ColorRef.textPrimaryColor),
                          title: Text(
                            provider.profileDetails[index]['label'],
                            style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Lato', color: ColorRef.textPrimaryColor, fontSize: width * 0.035),
                          ),
                          onTap: () => provider.onMyAccountNavigate(index, context),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
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
