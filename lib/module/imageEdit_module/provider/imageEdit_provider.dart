import 'dart:async';
import 'dart:math';
import 'dart:io';
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
  bool isBold = false;
  bool isItalic = false;
  bool isUnderline = false;
  double _fontSize = 25.0;
  double get fontSize => _fontSize;
  bool isUppercase = false;
  int selectedCaseIndex = 0;
  int selectedTextStyle = 0;
  Color _selectedColor = ColorRef.black202020;
  List<Color> colors = [
    ColorRef.black202020,
    ColorRef.black3F3E3E,
    ColorRef.black616161,
    ColorRef.grey848484,
    ColorRef.greyB3B3B3,
    ColorRef.whiteFFFFFF,
    ColorRef.blue1950AA,
    ColorRef.blue0566CF,
    ColorRef.blue670F7F,
    ColorRef.blue5239A1,
    ColorRef.red9A0058,
    ColorRef.green017374,
    ColorRef.green0A6609,
    ColorRef.green1F9C1E,
    ColorRef.green86BB09,
    ColorRef.green20CE1C,
    ColorRef.orangeD2622D,
    ColorRef.brown4E2E2F,
    ColorRef.pinkC12194,
    ColorRef.redEE103F,
    ColorRef.pinkF28F8F,
    ColorRef.pinkBA68C8,
    ColorRef.redE60406,
    ColorRef.orangeF25206,
    ColorRef.orangeFA7C03,
    ColorRef.orangeFFA500,
    ColorRef.yellowFFE309,
    ColorRef.blue00D4FC,
    ColorRef.pinkFF8EDE,
    ColorRef.blue005B87,
  ];
  List<double> shadeOpacities = [0.6, 0.5, 0.4, 0.3, 0.2];
  Color get selectedColor => _selectedColor;

  void onColorChange(Color color) {
    _selectedColor = color;
    notifyListeners();
  }

  void onColorOpacityChange(double opacity) {
    _selectedColor = _selectedColor.withOpacity(opacity);
    notifyListeners();
  }


  List<String> letters = ['B', 'I', 'U'];
  List<String> cases = ['Aa', 'AA', 'aa'];

  void increaseFontSize() {
    _fontSize += 1.0;
    notifyListeners();
  }

  void decreaseFontSize() {
    if (_fontSize > 1.0) {
      _fontSize -= 1.0;
      notifyListeners();
    }
  }

  void toggleTextStyle(String letter,int index) {
    selectedTextStyle=index;
    if (letter == 'B') {
      isBold = !isBold;
    } else if (letter == 'I') {
      isItalic = !isItalic;
    } else if (letter == 'U') {
      isUnderline = !isUnderline;
    }
    notifyListeners();
  }
  String inputString = '';
  void toggleTextCase(String selectedCase, int index) {
    selectedCaseIndex = index;
    if (selectedCase == 'AA') {
      isUppercase = true;
    }
    if (selectedCase == 'Aa') {
      inputString = inputString. substring(0, 1).toUpperCase() + inputString.substring(1);
      isUppercase = false;
    }
    if (selectedCase == 'aa') {
      isUppercase = false;
    }
    notifyListeners();
  }

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
      String text = '';

      String? result = await showDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.3),
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            alignment: Alignment.center,
            child: SizedBox(
              height: 260,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SvgPicture.asset(SvgPath.cancel),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 110),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        TextField(
                          decoration: const InputDecoration(
                            hintText: 'Write Here',
                            border: InputBorder.none,
                          ),
                          onChanged: (value) => text = value,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Navigator.pop(context, text),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 90),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: ColorRef.yellowFFA500,
                        borderRadius: BorderRadius.circular(10),
                      ),
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
        boardController.add<CustomItem>(
          CustomItem(
            customText: result,
            onDel: () async => true,
          ),
        );
      }
    } else if(index == 1){
      debugPrint("stickers");
    }
    else if (index == 2) {
      // Add image from gallery
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


class CustomItem extends StackBoardItem {
  const CustomItem({
    this.customText,
    Future<bool> Function()? onDel,
    int? id,
  }) : super(
    child: const Text(''),
    onDel: onDel,
    id: id,
  );

  final String? customText;

  @override
  CustomItem copyWith({
    CaseStyle? caseStyle,
    Widget? child,
    int? id,
    Future<bool> Function()? onDel,
    dynamic Function(bool)? onEdit,
    bool? tapToEdit,
    Color? color,
  }) =>
      CustomItem(
        onDel: onDel,
        id: id,
        customText: customText ?? this.customText,
      );
}


