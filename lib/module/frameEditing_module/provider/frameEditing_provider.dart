import 'package:festo_post/module/info_module/view/info_view.dart';
import 'package:flutter/material.dart';
import '../../../utils/routes.dart';
import '../../imageEdit_module/view/imageEdit_view.dart';

class FrameEditorProvider extends ChangeNotifier {
  bool isImageSelected = true;
  bool isVideoSelected = false;
  String? selectedImage;

  List<String> languages = ['All Languages', 'English', 'Hindi', 'Gujarati', 'Marathi'];
  String selectedLanguage = 'English';

  void toggleSelection(bool isImage) {
    if (isImage) {
      isImageSelected = true;
      isVideoSelected = false;
    } else {
      isImageSelected = false;
      isVideoSelected = true;
    }
    notifyListeners();
  }

  void setSelectedImage(String imagePath) {
    selectedImage = imagePath;
    notifyListeners();
  }

  void onBack() {
    NavigationService.replaceToNamed('dashboard');
  }

  void setSelectedLanguage(String language) {
    selectedLanguage = language;
    notifyListeners();
  }

  void onInfo(BuildContext context, final String label) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InfoView(label: label),
      ),
    );
  }

  void onNext(BuildContext context, final String label, String? selectedImage) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageEditView(label: label, selectedImage: selectedImage),
      ),
    );
  }
}
