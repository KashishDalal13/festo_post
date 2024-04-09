import 'package:festo_post/utils/bool.dart';

import '../../../app_export.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

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
                StrRef.aboutUs,
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
                    StrRef.aboutTitle1,
                    style: TextStyle(
                      color: ColorRef.textPrimaryColor,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
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
                    StrRef.aboutTitle2,
                    style: TextStyle(
                      color: ColorRef.textPrimaryColor,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 20),
                  BoolRef.themeChange?Image.asset(SvgPath.loopBotsDark,height: 50,width: 250):Image.asset(SvgPath.loopBotsLight,height: 50,width: 250)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
