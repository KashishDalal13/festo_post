import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/routes.dart';

class InfoProvider extends ChangeNotifier{
  void onBack() {
    NavigationService.goBack();
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)); // Copy text to clipboard
  }
  
}