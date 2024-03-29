import 'package:festo_post/app_export.dart';

class DownloadPostView extends StatelessWidget {
  final File? imageData;

  const DownloadPostView({super.key, this.imageData});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DownloadPostProvider(),
      builder: (context, child) {
        DownloadPostProvider provider = context.watch<DownloadPostProvider>();
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorRef.white,
              surfaceTintColor: ColorRef.white,
              leading: IconButton(
                onPressed: () => provider.onBack(),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 24,
                  color: BoolRef.themeChange ? ColorRef.white : ColorRef.black202020,
                ),
              ),
              centerTitle: true,
              title: Text(StrRef.downloadShare, style: const TextStyle(fontSize: 20, fontFamily: 'Lato', fontWeight: FontWeight.w400)),
            ),
            resizeToAvoidBottomInset: false,
            body: Image.file(imageData!, width: 300, height: 300),

        ),
        );
      },
    );
  }
}