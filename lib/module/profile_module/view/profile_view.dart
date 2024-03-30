import 'package:festo_post/app_export.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
                  margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  padding: const EdgeInsets.all(10.0),
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
                            height: 80,
                            width: 80,
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
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, fontFamily: "Lato", color: ColorRef.textPrimaryColor),
                                ),
                                Text(StrRef.phnNo,
                                    style: TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.w400, fontFamily: "Lato", color: BoolRef.themeChange ? ColorRef.whiteFFFFFF : ColorRef.blue0250A4)),
                              ],
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => provider.onTapEdit(),
                            child: SvgPicture.asset(
                              provider.isEdit ? SvgPath.cancelEdit : SvgPath.iconFrame,
                              height: 25,
                              width: 25,
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
                                  hintStyle: TextStyle(fontFamily: 'Lato', fontSize: 15, color: ColorRef.textPrimaryColor),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: SvgPicture.asset(SvgPath.profile, color: BoolRef.themeChange ? ColorRef.blue3498DB : ColorRef.blue0250A4, ),
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
                                  hintStyle: TextStyle(fontFamily: 'Lato', fontSize: 15, color: ColorRef.textPrimaryColor),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: SvgPicture.asset(SvgPath.phone, color:BoolRef.themeChange ? ColorRef.blue3498DB : ColorRef.blue0250A4),
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
                                  style: TextStyle(color: ColorRef.textPrimaryColor, fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Lato'),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration:
                            BoxDecoration(border: Border.all(color: BoolRef.themeChange ? ColorRef.transparent : ColorRef.greyD6D6D6), borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          leading: SvgPicture.asset(
                            provider.profileDetails[index]['icon'],
                            height: 20,
                            width: 20,
                            colorFilter: ColorFilter.mode(ColorRef.textPrimaryColor!, BlendMode.srcIn),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20, color: ColorRef.textPrimaryColor),
                          title: Text(
                            provider.profileDetails[index]['label'],
                            style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Lato', color: ColorRef.textPrimaryColor, fontSize: 15),
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
