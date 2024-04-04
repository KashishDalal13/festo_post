import '../../../app_export.dart';

class RefundView extends StatelessWidget {
  const RefundView({super.key});

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
                onPressed: () => NavigationService.routeToNamed('dashboard'),
                icon: Icon(Icons.arrow_back_ios_rounded,
                    size: 20, color: ColorRef.textPrimaryColor),
              ),
              centerTitle: true,
              title: Text(
                StrRef.refund,
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
                            fontWeight: FontWeight.w500,
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
                            fontWeight: FontWeight.w500,
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
                            fontWeight: FontWeight.w500,
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
