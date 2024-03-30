import 'package:festo_post/app_export.dart';
class DownloadPostProvider extends ChangeNotifier {

  Future<void> saveImage(Uint8List bytes) async {
    final directory = await getExternalStorageDirectory();
    final image = File('${directory!.path}/captured_image.png');
    await image.writeAsBytes(bytes);
  }
}