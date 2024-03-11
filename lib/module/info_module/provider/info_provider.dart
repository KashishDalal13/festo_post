import 'package:flutter/material.dart';

import '../../../utils/routes.dart';

class InfoProvider extends ChangeNotifier{
  void onBack() {
    NavigationService.replaceToNamed('frame');
  }
  
}