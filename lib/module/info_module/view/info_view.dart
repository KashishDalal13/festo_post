import 'package:festo_post/app_export.dart';

class InfoView extends StatelessWidget {
  final String? label;

  const InfoView({
    Key? key,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: const Alignment(0, 1.15),
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0)),
                            color: ColorRef.yellowFFA500,
                          ),
                          alignment: Alignment.center,
                          child: Image.asset(SvgPath.info),
                        ),
                        IconButton(
                          onPressed: () => NavigationService.goBack(),
                          icon: Icon(Icons.arrow_back_ios_new_rounded, size: 24, color: ColorRef.textPrimaryColor),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 280,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: BoolRef.themeChange ? ColorRef.grey304359 : ColorRef.white),
                      child: Text(
                        label ?? "",
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: BoolRef.themeChange ? ColorRef.blue3498DB : ColorRef.blue0250A4,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    children: [
                      Text(StrRef.info, style: TextStyle(fontSize: 14, fontFamily: 'Lato', fontWeight: FontWeight.w400, color: ColorRef.textPrimaryColor)),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Divider(thickness: 0.5, endIndent: 10, color: ColorRef.grey717171)),
                          Text(StrRef.tag, style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Lato', fontSize: 16, color: BoolRef.themeChange ? ColorRef.blue3498DB : ColorRef.blue0250A4)),
                          Expanded(child: Divider(thickness: 0.5, color: ColorRef.grey717171, indent: 10)),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Stack(
                        alignment: const Alignment(1, 1.40),
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: BoolRef.themeChange ? ColorRef.grey304359 : ColorRef.transparent,
                                border: BoolRef.themeChange ? null : Border.all(color: ColorRef.greyEDEDED, width: 2),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(StrRef.hashtag, style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 14, color: ColorRef.textPrimaryColor)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Clipboard.setData(ClipboardData(text: StrRef.hashtag)),
                            child: Container(
                              decoration: BoxDecoration(
                                // shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(50.0),
                                color: ColorRef.yellowFFA500,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Icon(
                                  Icons.copy_outlined,
                                  size: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
