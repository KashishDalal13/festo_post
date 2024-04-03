import 'package:festo_post/app_export.dart';

class DownloadPostProvider extends ChangeNotifier {
  Uint8List? downloadImage;

  onDownload(Uint8List imageData) async {
    downloadImage = imageData;
    await ImageGallerySaver.saveImage(downloadImage!,quality: 100);
    debugPrint("Image saved to gallery");
  }

  List<Map<String, dynamic>> shareLogo = [
    {"logo": SvgPath.whatsapp},
    {"logo": SvgPath.instagram},
    {"logo": SvgPath.facebook},
    {"logo": SvgPath.reddit},
    {"logo": SvgPath.linkedIn},
    {"logo": SvgPath.messenger},
    {"logo": SvgPath.twitter},
    {"logo": SvgPath.pinterest},
    {"logo": SvgPath.menu},
  ];
}