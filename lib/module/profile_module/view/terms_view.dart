import '../../../app_export.dart';

class TermsView extends StatelessWidget {
  const TermsView({super.key});

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
                StrRef.terms,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    StrRef.termsServices,
                    style: TextStyle(
                      color: ColorRef.textPrimaryColor,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\u2022', // Unicode character for bullet dot
                        style: TextStyle(
                          color: BoolRef.themeChange
                              ? ColorRef.greyF3F3F3
                              : ColorRef.grey757575,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Adjust the space between bullet and text
                      Expanded(
                        child: Text(
                          StrRef.aboutText,
                          style: TextStyle(
                            color: BoolRef.themeChange
                                ? ColorRef.greyF3F3F3
                                : ColorRef.grey757575,
                            fontFamily: 'Lato',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\u2022', // Unicode character for bullet dot
                        style: TextStyle(
                          color: BoolRef.themeChange
                              ? ColorRef.greyF3F3F3
                              : ColorRef.grey757575,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Adjust the space between bullet and text
                      Expanded(
                        child: Text(
                          StrRef.aboutText,
                          style: TextStyle(
                            color: BoolRef.themeChange
                                ? ColorRef.greyF3F3F3
                                : ColorRef.grey757575,
                            fontFamily: 'Lato',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\u2022', // Unicode character for bullet dot
                        style: TextStyle(
                          color: BoolRef.themeChange
                              ? ColorRef.greyF3F3F3
                              : ColorRef.grey757575,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Adjust the space between bullet and text
                      Expanded(
                        child: Text(
                          StrRef.aboutText,
                          style: TextStyle(
                            color: BoolRef.themeChange
                                ? ColorRef.greyF3F3F3
                                : ColorRef.grey757575,
                            fontFamily: 'Lato',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  Text(
                    StrRef.termsServices,
                    style: TextStyle(
                      color: ColorRef.textPrimaryColor,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\u2022', // Unicode character for bullet dot
                        style: TextStyle(
                          color: BoolRef.themeChange
                              ? ColorRef.greyF3F3F3
                              : ColorRef.grey757575,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Adjust the space between bullet and text
                      Expanded(
                        child: Text(
                          StrRef.aboutText,
                          style: TextStyle(
                            color: BoolRef.themeChange
                                ? ColorRef.greyF3F3F3
                                : ColorRef.grey757575,
                            fontFamily: 'Lato',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\u2022', // Unicode character for bullet dot
                        style: TextStyle(
                          color: BoolRef.themeChange
                              ? ColorRef.greyF3F3F3
                              : ColorRef.grey757575,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Adjust the space between bullet and text
                      Expanded(
                        child: Text(
                          StrRef.aboutText,
                          style: TextStyle(
                            color: BoolRef.themeChange
                                ? ColorRef.greyF3F3F3
                                : ColorRef.grey757575,
                            fontFamily: 'Lato',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\u2022', // Unicode character for bullet dot
                        style: TextStyle(
                          color: BoolRef.themeChange
                              ? ColorRef.greyF3F3F3
                              : ColorRef.grey757575,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Adjust the space between bullet and text
                      Expanded(
                        child: Text(
                          StrRef.aboutText,
                          style: TextStyle(
                            color: BoolRef.themeChange
                                ? ColorRef.greyF3F3F3
                                : ColorRef.grey757575,
                            fontFamily: 'Lato',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
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