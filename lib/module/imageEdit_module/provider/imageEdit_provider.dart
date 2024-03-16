import 'dart:async';
import 'dart:math';
import 'dart:io';
import 'package:festo_post/module/imageEdit_module/stackboard_custom_item.dart';
import 'package:festo_post/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stack_board/stack_board.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/routes.dart';
import '../../../utils/string.dart';

class ImageEditProvider extends ChangeNotifier {
  String framecurrentIndex = "";
  String currentIndex = "";
  StackBoardController boardController = StackBoardController();
  final GlobalKey boardKey = GlobalKey();
  List<Map<String, dynamic>> frameDetails = [
    {
      "imageList": SvgPath.frameLogo,
      "add": SvgPath.logo,
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
      "show": false,
      "position": const Offset(0.1, 0.1),
      "top": 0.0,
      "left": 0.0,
      "scale": 1.0,
      "rotation": 0.0,
    },
  ];
  List<Map<String, dynamic>> EditDetails = [
    {"image": SvgPath.text, "label": "Text"},
    {"image": SvgPath.sticker, "label": "Sticker"},
    {"image": SvgPath.image_gallery, "label": "Image"},
    {"image": SvgPath.volume, "label": "Audio"},
  ];
  Map<String, dynamic> activeItem = {};
  bool inAction = false;
  double? currentScale, currentRotation;
  void edit({required int index, required BuildContext context}) async {
    currentIndex = index.toString();
    debugPrint("${EditDetails[index]} $currentIndex");
    notifyListeners();

    if (index == 0) {
      String text = ''; // Initialize text

      String? result = await showDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.3),
        // barrierDismissible: false,
        useSafeArea: true,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            // shadowColor: Colors.black.withOpacity(0.3),
            elevation: 0,
            alignment: Alignment.center,
            // color: ColorRef.transparent,
            child: SizedBox(
              height: 260,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => NavigationService.goBack(),
                    child: Container(
                      decoration: BoxDecoration(color: ColorRef.white, borderRadius: BorderRadius.circular(15)),
                      child: SvgPicture.asset(SvgPath.cancel),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 110),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 2, blurRadius: 5, offset: const Offset(0, 3))],
                    ),
                    child: Column(
                      children: [
                        TextField(
                          decoration: const InputDecoration(hintText: 'Write Here', border: InputBorder.none),
                          onChanged: (value) => text = value,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => NavigationService.goBack(),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 90),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(color: ColorRef.yellowFFA500, borderRadius: BorderRadius.circular(10)),
                      child: Text('Add', style: TextStyle(color: ColorRef.black202020)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

      if (result != null) {
        Completer<bool> completer = Completer<bool>();
        boardController.add(CustomItem(
                childWidget: GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) => const SizedBox(
                          height: 300, // Adjust height as needed
                          child: Center(child: Text('This is a bottom sheet', style: TextStyle(fontSize: 20.0))),
                        ),
                      );
                    },
                    child: Text(result)))
            /*AdaptiveText(
            result,
            tapToEdit: false,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 25, fontFamily: 'Lato'),
            onDel: () {
              // Open bottom sheet here
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) => const SizedBox(
                    height: 300, // Adjust height as needed
                    child: Center(child: Text('This is a bottom sheet', style: TextStyle(fontSize: 20.0))),
                  ),
              ).then((value) => completer.complete(true));
              return completer.future;
            },
          ),*/
            );
      }
    } else if (index == 2) {
      ImagePicker().pickImage(source: ImageSource.gallery).then(
        (value) {
          if (value != null) {
            final imageFile = File(value.path);
            boardController.add(
              StackBoardItem(
                child: Image.file(imageFile),
              ),
            );
          }
        },
      );
    }
  }

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
      h = height / 1.85;
      w = width / 3.2;
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
      h = height / 1.85;
      w = width / 3.2;
    } else if (height < 800 && width < 370) {
      debugPrint("Medium device");
      h = height / 1.96;
      w = width / 2.0;
    } else if (height > 800 && width > 370) {
      debugPrint("Large device");
      h = height / 1.56;
      w = width / 2.0;
    }
    debugPrint("$height $width");
    activeItem['left'] += (details.focalPointDelta.dx);
    activeItem['top'] += (details.focalPointDelta.dy);
    activeItem['left'] = (activeItem['left'] as double).clamp(2, width - w);
    activeItem['top'] = (activeItem['top'] as double).clamp(2, height - h);
    activeItem['position'] =
        Offset(activeItem['left'].toDouble(), activeItem['top'].toDouble());
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
