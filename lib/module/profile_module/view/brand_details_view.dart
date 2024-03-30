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
                leading: IconButton(onPressed: () => provider.onBack(), icon: Icon(Icons.arrow_back_ios_rounded, size: 20,color: ColorRef.textPrimaryColor)),
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
                        color:BoolRef.themeChange ? ColorRef.transparent : ColorRef.greyD6D6D6,
                      ),
                      child: Icon(
                        Icons.add,
                        color: ColorRef.blue0250A4,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(StrRef.uploadPNG, style: const TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w400, fontSize: 13)),
                  const SizedBox(height: 10),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.addDetail.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorRef.greyEDEDED),
                          child: TextFormField(
                            controller: provider.addDetail[index]['controller'],
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              hintText: provider.addDetail[index]['label'],
                              hintStyle: TextStyle(fontFamily: 'Lato', fontSize: 15, color: ColorRef.grey929292),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: SvgPicture.asset(provider.addDetail[index]['svg']),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
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
                        StrRef.submit,
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
