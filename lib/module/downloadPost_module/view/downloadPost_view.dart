import 'package:festo_post/app_export.dart';

class DownloadPostView extends StatelessWidget {
  final Uint8List? imageData;

  const DownloadPostView({super.key, this.imageData});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (BuildContext context) => DownloadPostProvider(),
      builder: (context, child) {
        DownloadPostProvider provider = context.watch<DownloadPostProvider>();
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => NavigationService.goBack(),
                icon: Icon(Icons.arrow_back_ios_new_rounded, size: 24, color: ColorRef.textPrimaryColor),
              ),
              centerTitle: true,
              title: Text(StrRef.downloadShare, style: const TextStyle(fontSize: 20, fontFamily: 'Lato', fontWeight: FontWeight.w400)),
            ),
            resizeToAvoidBottomInset: false,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.memory(imageData!, width: width, height: 350),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 170,
                    decoration: BoxDecoration(color: ColorRef.yellowFFA500, borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(StrRef.download, style: TextStyle(fontSize: 15, fontFamily: 'Lato', fontWeight: FontWeight.bold, color: ColorRef.black202020)),
                        Lottie.asset(SvgPath.download),
                      ],
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
