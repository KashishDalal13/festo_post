import 'package:festo_post/app_export.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

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
                StrRef.contactUs,
                style: TextStyle(
                  color: ColorRef.textPrimaryColor,
                  fontFamily: 'Lato',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child:
                        Image.asset(SvgPath.festoPost, height: 90, width: 90),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    StrRef.contactTitle,
                    style: TextStyle(
                      color: BoolRef.themeChange
                          ? ColorRef.greyF3F3F3
                          : ColorRef.grey757575,
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    StrRef.contactLabel,
                    style: TextStyle(
                      color: ColorRef.textPrimaryColor,
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    StrRef.emailId,
                    style: TextStyle(
                      color: ColorRef.textPrimaryColor,
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "support@festopost.com",
                    style: TextStyle(
                      color: ColorRef.blue3498DB,
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    StrRef.website,
                    style: TextStyle(
                      color: ColorRef.textPrimaryColor,
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Fesopost.com",
                    style: TextStyle(
                      color: ColorRef.blue3498DB,
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    StrRef.phone,
                    style: TextStyle(
                      color: ColorRef.textPrimaryColor,
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "+91 261 3573264",
                    style: TextStyle(
                      color: ColorRef.blue3498DB,
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    StrRef.socialMedia,
                    style: TextStyle(
                      color: ColorRef.textPrimaryColor,
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SvgPicture.asset(SvgPath.facebook,height: 30,width: 30,),
                      const SizedBox(width: 15,),
                      SvgPicture.asset(SvgPath.instagram,height: 30,width: 30,),
                    ],
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
