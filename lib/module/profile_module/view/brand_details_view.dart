import '../../../app_export.dart';

class BrandDetailsView extends StatelessWidget {
  const BrandDetailsView({super.key});

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
                leading: IconButton(onPressed: () => provider.onBack(), icon: Icon(Icons.arrow_back_ios_rounded, size: 20, color: ColorRef.textPrimaryColor)),
                centerTitle: true,
                title: Text(StrRef.addDetails, style: const TextStyle(fontFamily: 'Lato', fontSize: 18))),
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => debugPrint("upload"),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: BoolRef.themeChange ? ColorRef.transparent : ColorRef.greyD6D6D6),
                          color: BoolRef.themeChange ? ColorRef.backgroundColor : ColorRef.transparent),
                      child: Icon(
                        Icons.add,
                        color: BoolRef.themeChange ? ColorRef.textPrimaryColor : ColorRef.blue0250A4,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(StrRef.uploadPNG, style: TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w400, fontSize: 13, color: ColorRef.textPrimaryColor)),
                  const SizedBox(height: 10),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.addDetail.length,
                      itemBuilder: (BuildContext context, int index) {
                        final bool showArrow = index == 1;
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () => provider.onListTileTap(index: index),
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: BoolRef.themeChange ? ColorRef.backgroundColor : ColorRef.transparent,
                                  border: Border.all(color: BoolRef.themeChange ? ColorRef.transparent : ColorRef.greyD6D6D6),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: showArrow
                                          ? GestureDetector(
                                              // onTap:()=>provider.onListTileTap(index: index),
                                              child: Container(
                                                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(SvgPath.suitcase, color: ColorRef.textPrimaryColor),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      provider.addDetail[index]['label'],
                                                      style: TextStyle(fontFamily: 'Lato', fontSize: 15, color: ColorRef.textPrimaryColor),
                                                    ),
                                                    const Spacer(),
                                                    provider.isExpand ?Icon(Icons.keyboard_arrow_down, color: ColorRef.textPrimaryColor):Icon(Icons.keyboard_arrow_up, color: ColorRef.textPrimaryColor),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : TextFormField(
                                              controller: provider.addDetail[index]['controller'],
                                              decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                hintText: provider.addDetail[index]['label'],
                                                hintStyle: TextStyle(fontFamily: 'Lato', fontSize: 15, color: ColorRef.textPrimaryColor),
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                                  child: SvgPicture.asset(provider.addDetail[index]['svg'],
                                                      colorFilter: ColorFilter.mode(ColorRef.textPrimaryColor!, BlendMode.srcIn)),
                                                ),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //isExpand && index==1 then show
                            if (provider.isExpand && index == 1)
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: BoolRef.themeChange ? ColorRef.backgroundColor : ColorRef.greyE0E0E0,
                                  border: Border.all(color: BoolRef.themeChange ? ColorRef.grey304359 : ColorRef.greyD6D6D6),
                                ),
                                child: SizedBox(
                                  height: 300,
                                  child: ListView.separated(
                                    itemCount: provider.category.length,
                                    padding: const EdgeInsets.all(20),
                                    itemBuilder: (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () => provider.onSelectBrandCategory(brand: provider.category[index]),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: BoolRef.themeChange ? ColorRef.transparent : ColorRef.transparent),
                                              color: BoolRef.themeChange ? ColorRef.blue1E2A38 : ColorRef.whiteFFFFFF,
                                              borderRadius: BorderRadius.circular(10)),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            provider.category[index],
                                            style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Lato', color: ColorRef.textPrimaryColor, fontSize: 15),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () => debugPrint("add"),
                    child: Container(
                      height: 40,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(color: ColorRef.yellowFFA500, borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: Text(
                        StrRef.add,
                        style: TextStyle(color: ColorRef.black202020, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
                      ),
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
