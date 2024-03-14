import 'dart:math';

import 'package:flutter/material.dart';

import '../../../utils/routes.dart';
import '../../../utils/string.dart';

class ImageEditProvider extends ChangeNotifier {
  String framecurrentIndex = "";
  List<Map<String, dynamic>> frameDetails = [
    {
      "imageList": SvgPath.frameLogo,
      "add": SvgPath.logo,
      "key": GlobalKey(),
      "show": false,
      "position": const Offset(0.1, 0.1),
      "top": 0.0,
      "left": 0.0,
      "scale": 1.0,
      "rotation": 0.0,
    },
    {
      "imageList": SvgPath.framePhone,
      "add": SvgPath.contactDetail,
      "key": GlobalKey(),
      "show": false,
      "position": const Offset(0.1, 0.1),
      "top": 0.0,
      "left": 0.0,
      "scale": 1.0,
      "rotation": 0.0,
    },
    {
      "imageList": SvgPath.frameEmail,
      "add": SvgPath.mailDetail,
      "key": GlobalKey(),
      "show": false,
      "position": const Offset(0.1, 0.1),
      "top": 0.0,
      "left": 0.0,
      "scale": 1.0,
      "rotation": 0.0,
    },
    {
      "imageList": SvgPath.frameWeb,
      "add": SvgPath.webDetail,
      "key": GlobalKey(),
      "show": false,
      "position": const Offset(0.1, 0.1),
      "top": 0.0,
      "left": 0.0,
      "scale": 1.0,
      "rotation": 0.0,
    },
    {
      "imageList": SvgPath.frameLocation,
      "add": SvgPath.locationDetail,
      "key": GlobalKey(),
      "show": false,
      "position": const Offset(0.1, 0.1),
      "top": 0.0,
      "left": 0.0,
      "scale": 1.0,
      "rotation": 0.0,
    },
  ];
  Map<String, dynamic> activeItem = {};
  bool inAction = false;
  double? currentScale, currentRotation;
  final GlobalKey contentKey = GlobalKey();

  void frameDetailsdisplay({required int index}) {
    framecurrentIndex = index.toString();
    frameDetails[index]['show'] = !frameDetails[index]['show'];
    activeItem = frameDetails[index];
    debugPrint("${frameDetails[index]}");
    notifyListeners();
  }

  onPanUpdate(details, double width, double height, BuildContext context) {
    double h = 0, w = 0;
    if (height < 750 && width < 370) {
      debugPrint("Small device");
      h = height / 2.2;
      w = width / 4;
    } else if (height < 800 && width < 370) {
      debugPrint("Medium device");
      h = height / 1.96;
      w = width / 3.2;
    } else if (height > 800 && width > 370) {
      debugPrint("Large device");
      h = height / 2.26;
      w = width / 3.66;
    }
    activeItem['left'] += (details.delta.dx);
    activeItem['top'] += (details.delta.dy);
    debugPrint("$height $width ${height / 1.3} $details");
    activeItem['left'] = (activeItem['left'] as double).clamp(2, width - w);
    activeItem['top'] = (activeItem['top'] as double).clamp(2, height - h);
    notifyListeners();
  }

  onPointerUp() {
    inAction = false;
    notifyListeners();
  }

  onPointerDown(details, data) {
    if (inAction) return;
    inAction = true;
    activeItem = data;
    debugPrint("$activeItem");
    currentScale = data['scale'];
    currentRotation = data['rotation'];
    notifyListeners();
  }

  onScaleStart(details) {
    currentScale = activeItem['scale'];
    currentRotation = activeItem['rotation'];
    notifyListeners();
  }

  onScaleUpdate(ScaleUpdateDetails details, height, width) {
    double h = 0, w = 0;
    if (height < 750 && width < 370) {
      debugPrint("Small device");
      h = height / 2.22;
      w = width / 1.86;
    } else if (height < 800 && width < 370) {
      debugPrint("Medium device");
      h = height / 1.96;
      w = width / 3.2;
    } else if (height > 800 && width > 370) {
      debugPrint("Large device");
      h = height / 2.26;
      w = width / 3.66;
    }
    debugPrint("$h $w");
    activeItem['left'] += (details.focalPointDelta.dx);
    activeItem['top'] += (details.focalPointDelta.dy);
    activeItem['left'] = (activeItem['left'] as double).clamp(2, w);
    activeItem['top'] = (activeItem['top'] as double).clamp(2, h);
    activeItem['position'] = Offset(activeItem['left'].toDouble(), activeItem['top'].toDouble());
    activeItem['rotation'] = details.rotation + currentRotation!;
    debugPrint("$activeItem");
    double scale = max(min(details.scale * currentScale!, 2), 0.3);
    activeItem['scale'] = scale;
    notifyListeners();
  }

  void onBack() {
    NavigationService.goBack();
  }
}
