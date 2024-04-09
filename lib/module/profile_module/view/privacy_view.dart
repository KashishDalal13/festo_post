import '../../../app_export.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({super.key});

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
                icon: Icon(Icons.arrow_back_ios_rounded,
                    size: 20, color: ColorRef.textPrimaryColor),
              ),
              centerTitle: true,
              title: Text(
                StrRef.privacy,
                style: TextStyle(
                  color: ColorRef.textPrimaryColor,
                  fontFamily: 'Lato',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Text(
                    StrRef.intro,
                    style: TextStyle(
                      color: ColorRef.textPrimaryColor,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    StrRef.aboutText,
                    style: TextStyle(
                      color: BoolRef.themeChange
                          ? ColorRef.greyF3F3F3
                          : ColorRef.grey757575,
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    StrRef.personalData,
                    style: TextStyle(
                      color: ColorRef.textPrimaryColor,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    StrRef.aboutText,
                    style: TextStyle(
                      color: BoolRef.themeChange
                          ? ColorRef.greyF3F3F3
                          : ColorRef.grey757575,
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    StrRef.dataSecurity,
                    style: TextStyle(
                      color: ColorRef.textPrimaryColor,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    StrRef.aboutText,
                    style: TextStyle(
                      color: BoolRef.themeChange
                          ? ColorRef.greyF3F3F3
                          : ColorRef.grey757575,
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    StrRef.aboutQuery,
                    style: TextStyle(
                      color: ColorRef.textPrimaryColor,
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "contact@loopbots.com",
                    style: TextStyle(
                      color: ColorRef.blue3498DB,
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
