import 'package:festo_post/app_export.dart';

class InfoProvider extends ChangeNotifier{
  void onBack() {
    NavigationService.goBack();
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)); // Copy text to clipboard
  }
  
}