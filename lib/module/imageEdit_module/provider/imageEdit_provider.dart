import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/routes.dart';
import '../../../utils/string.dart';

class ImageEditProvider extends ChangeNotifier {
  String framecurrentIndex = "";
  List<Map<String, dynamic>> frameDetails = [
    {"imageList": SvgPath.frameLogo, "add": SvgPath.logo, "show": false, "top": 0.0, "left": 0.0},
    {"imageList": SvgPath.framePhone, "add": SvgPath.contactDetail, "show": false, "top": 0.0, "left": 0.0},
    {"imageList": SvgPath.frameEmail, "add": SvgPath.mailDetail, "show": false, "top": 0.0, "left": 0.0},
    {"imageList": SvgPath.frameWeb, "add": SvgPath.webDetail, "show": false, "top": 0.0, "left": 0.0},
    {"imageList": SvgPath.frameLocation, "add": SvgPath.locationDetail, "show": false, "top": 0.0, "left": 0.0},
  ];

  void frameDetailsdisplay({required int index}) {
    framecurrentIndex = index.toString();
    frameDetails[index]['show'] = !frameDetails[index]['show'];
    debugPrint("${frameDetails[index]}");
    notifyListeners();
  }

  onPanUpdate(details, double width, double height, int index, BuildContext context) {
    frameDetails[index]['left'] += details.delta.dx;
    frameDetails[index]['top'] += details.delta.dy;
    debugPrint("$height $width ${height / 1.3 } $details");
    frameDetails[index]['left'] = (frameDetails[index]['left'] as double).clamp(2, width - (width / 3));
    frameDetails[index]['top'] = (frameDetails[index]['top'] as double).clamp(2, height - (height / 1.85));
    notifyListeners();
  }

  void onBack() {
    NavigationService.goBack();
  }
}
