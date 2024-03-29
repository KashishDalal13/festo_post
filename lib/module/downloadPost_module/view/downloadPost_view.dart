import 'package:festo_post/app_export.dart';

class DownloadPostView extends StatelessWidget {
  final Uint8List? imageData;

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
              leading: IconButton(
                onPressed: () => provider.onBack(),
                icon: Icon(Icons.arrow_back_ios_new_rounded, size: 24, color: ColorRef.textPrimaryColor),
              ),
              centerTitle: true,
              title: Text(StrRef.downloadShare, style: const TextStyle(fontSize: 20, fontFamily: 'Lato', fontWeight: FontWeight.w400)),
            ),
            resizeToAvoidBottomInset: false,
            body: Image.memory(imageData!, width: 300, height: 300),
          ),
        );
      },
    );
  }
}
