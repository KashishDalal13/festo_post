import 'package:festo_post/app_export.dart';

class DownloadPostProvider extends ChangeNotifier {
  Uint8List? downloadImage;

  onDownload(Uint8List imageData) async {
    downloadImage = imageData;
    await ImageGallerySaver.saveImage(downloadImage!,quality: 100);
    debugPrint("Image saved to gallery");
  }
}