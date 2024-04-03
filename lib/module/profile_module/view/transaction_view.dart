import '../../../app_export.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
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
              title: Text(StrRef.transaction,
                  style: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
            resizeToAvoidBottomInset: false,
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: BoolRef.themeChange
                            ? ColorRef.greyB0B0B0
                            : ColorRef.greyCACACA),
                    color: BoolRef.themeChange
                        ?ColorRef.containerBackgroundColor:ColorRef.whiteFFFFFF,
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            children: [
                              SvgPicture.asset(SvgPath.transactionID,height: 25,width: 25,color: ColorRef.textPrimaryColor,),
                              const SizedBox(width: 5),
                              Text("FP_1289574635",style: TextStyle(color: ColorRef.textPrimaryColor,fontWeight: FontWeight.w400,fontSize: 15,fontFamily: 'Lato'),),
                              const Spacer(),
                              SvgPicture.asset(SvgPath.transactionDate,height: 25,width: 25,color: ColorRef.textPrimaryColor,),
                              const SizedBox(width: 5),
                              Text("transactionID",style: TextStyle(color: ColorRef.textPrimaryColor,fontWeight: FontWeight.w400,fontSize: 15,fontFamily: 'Lato'),),
                            ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            children: [
                              SvgPicture.asset(SvgPath.transactionAmt,height: 25,width: 25,color: ColorRef.textPrimaryColor,),
                              const SizedBox(width: 5),
                              Text("₹871.82",style: TextStyle(color: ColorRef.textPrimaryColor,fontWeight: FontWeight.w400,fontSize: 15,fontFamily: 'Lato'),),
                              const Spacer(),
                              const SizedBox(width: 5),
                              Text(StrRef.success,style: TextStyle(color: ColorRef.green2A9442,fontWeight: FontWeight.w400,fontSize: 15,fontFamily: 'Lato'),),
                            ],
                        ),
                      )
                    ],
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

