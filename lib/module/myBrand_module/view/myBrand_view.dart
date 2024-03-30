import '../../../app_export.dart';

class MyBrandView extends StatelessWidget {
  const MyBrandView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (BuildContext context) => MyBrandProvider(),
      builder: (context, child) {
        MyBrandProvider provider = context.watch<MyBrandProvider>();
        return Theme(
          data: BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => provider.onBack(),
                icon: Icon(Icons.arrow_back_ios_rounded, size: 20, color: ColorRef.textPrimaryColor),
              ),
              centerTitle: true,
              title: Text(StrRef.myBrand, style: const TextStyle(fontFamily: 'Lato', fontSize: 20)),
            ),
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: ColorRef.greyD6D6D6),
                  ),
                  child: Row(
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
                            const SizedBox(height: 5),
                            Text(StrRef.technology,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400, fontFamily: "Lato", color: BoolRef.themeChange ? ColorRef.whiteFFFFFF : ColorRef.grey494949)),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              SvgPath.iconFrame,
                              height: 25,
                              width: 25,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                        backgroundColor: ColorRef.whiteFFFFFF,
                                        surfaceTintColor: ColorRef.whiteFFFFFF,
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(StrRef.delete, style: const TextStyle(fontFamily: 'Lato', fontSize: 20, fontWeight: FontWeight.w400)),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(StrRef.deleteSure, style: TextStyle(fontFamily: 'Lato', fontSize: 16, fontWeight: FontWeight.w400,color: ColorRef.grey757575)),
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                                  margin:  const EdgeInsets.symmetric(vertical: 5),
                                                  decoration: BoxDecoration(
                                                    color: ColorRef.yellowFFA500,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: TextButton(
                                                    child: Text('Apply', style: TextStyle(fontFamily: 'Lato', fontSize: 15, fontWeight: FontWeight.w400, color: ColorRef.black202020)),
                                                    onPressed: () => NavigationService.goBack(),
                                                  ),
                                                ), Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                                  decoration: BoxDecoration(
                                                    color: ColorRef.yellowFFA500,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: TextButton(
                                                    child: Text('Apply', style: TextStyle(fontFamily: 'Lato', fontSize: 15, fontWeight: FontWeight.w400, color: ColorRef.black202020)),
                                                    onPressed: () => NavigationService.goBack(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: SvgPicture.asset(SvgPath.trash, height: 25, width: 25)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SvgPicture.asset(SvgPath.brandadd, height: 50, width: 50),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => provider.onBack(),
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                    decoration: BoxDecoration(color: ColorRef.yellowFFA500, borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      StrRef.subscribe,
                      style: TextStyle(color: ColorRef.black202020, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
                    ),
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
