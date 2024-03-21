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
  int stickerIndex = 0;
  StackBoardController boardController = StackBoardController();
  final GlobalKey boardKey = GlobalKey();
  bool isBold = false;
  bool isItalic = false;
  bool isUnderline = false;
  double _fontSize = 25.0;

  double get fontSize => _fontSize;
  bool isUppercase = false;
  String selectedTextCase = '';
  String selectedCaseIndex = '';
  String selectedTextStyle = '';

  // Color selectedColor = const Color(0xff505050);
  Color _selectedColor = const Color(0xff505050);
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.teal,
    Colors.indigo,
    Colors.brown,
    Colors.black,
    Colors.grey,
    Colors.white,
  ];
  List<double> shadeOpacities = [0.5, 0.4, 0.3, 0.2, 0.1];

  Color get selectedColor => _selectedColor;

  void onColorChange(Color color) {
    _selectedColor = color;
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

  void toggleTextStyle(String letter, int index) {
    selectedTextStyle = index.toString();
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
    selectedCaseIndex = index.toString();
    if (selectedCase == 'AA') {
      selectedTextCase='AA';
      isUppercase = true;
    }
    if (selectedCase == 'Aa') {
      selectedTextCase='Aa';
      isUppercase = false;
    }
    if (selectedCase == 'aa') {
      selectedTextCase='aa';
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

  List<Map<String, dynamic>> stickerList = [
    {
      "label": "All",
      "imageList": [
        SvgPath.sticker4,
        SvgPath.sticker1,
        SvgPath.sticker10,
        SvgPath.sticker1,
        SvgPath.sticker2
      ]
    },
    {
      "label": "Sale",
      "imageList": [SvgPath.sticker3, SvgPath.sticker5, SvgPath.sticker7]
    },
    {
      "label": "Food",
      "imageList": [SvgPath.sticker8, SvgPath.sticker6, SvgPath.sticker10]
    },
    {
      "label": "Birthday",
      "imageList": [SvgPath.sticker9, SvgPath.sticker5, SvgPath.sticker1]
    },
    {
      "label": "Thankyou",
      "imageList": [SvgPath.sticker10, SvgPath.sticker4, SvgPath.sticker8]
    },
    {
      "label": "Welcome",
      "imageList": [SvgPath.sticker6, SvgPath.sticker7, SvgPath.sticker9]
    },
    {
      "label": "Summer",
      "imageList": [SvgPath.sticker2, SvgPath.sticker3, SvgPath.sticker5]
    },
    {
      "label": "Fashion",
      "imageList": [SvgPath.sticker7, SvgPath.sticker4, SvgPath.sticker3]
    },
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 110),
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
                      child: Text('Add',
                          style: TextStyle(color: ColorRef.black202020)),
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
    } else if (index == 1) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: 420,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  color: ColorRef.greyEDEDED,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                        width: 390,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          // padding: EdgeInsets.all(10.0),
                          shrinkWrap: true,
                          itemCount: stickerList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  onSelectSticker(index: index);
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 76,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: index == stickerIndex
                                      ? ColorRef.yellowFFA500
                                      : ColorRef.white,
                                ),
                                child: Center(
                                  child: Text(
                                    stickerList[index]['label'],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 5);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          // Adjust the cross axis count as needed
                          crossAxisSpacing: 15,
                          // Adjust the spacing between grid items as needed
                          mainAxisSpacing:
                              15, // Adjust the spacing between rows as needed
                        ),
                        itemCount:
                            stickerList[stickerIndex]['imageList'].length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Add the selected image to the StackBoard
                              boardController.add(
                                StackBoardItem(
                                  child: Image.asset(stickerList[stickerIndex]
                                      ['imageList'][index]),
                                ),
                              );
                            },
                            child: Image.asset(
                                stickerList[stickerIndex]['imageList'][index]),
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    } else if (index == 2) {
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

  void onSelectSticker({required int index}) {
    stickerIndex = index;
    String selectedStickerLabel = stickerList[index]['label'];
    if (selectedStickerLabel == 'Sports') {
      debugPrint("Sports");
    }
    notifyListeners();
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
