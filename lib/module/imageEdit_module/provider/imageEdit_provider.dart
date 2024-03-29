import 'dart:ui' as ui;

import 'package:festo_post/app_export.dart';

class ImageEditProvider extends ChangeNotifier {
  String framecurrentIndex = "";
  String currentItemId = "", currentIndex = "";
  int stickerIndex = 0, stickerViewIndex = 0;
  StackBoardController boardController = StackBoardController();
  final GlobalKey boardKey = GlobalKey();
  bool isBold = false;
  bool isItalic = false;
  bool isUnderline = false;
  int selectedFontSize = 22;
  Color selectedColor = const Color(0xff505050);
  List<double> shadeOpacities = [0.7, 0.6, 0.5, 0.4, 0.3, 0.2];

  bool isUppercase = false;
  String selectedTextCase = '';
  String selectedCaseIndex = '';
  String selectedTextStyle = '';
  String selectedFontFamily = '';
  Map<String, dynamic> activeItem = {};
  bool inAction = false;
  double? currentScale, currentRotation;

  List<String> fontFamilies = [
    'AltoneTrial',
    'Archivo',
    'avenir',
    'BalooTamma2',
    'Cardo',
    'DenkOne',
    'Fondamento',
    'HelveticaNeue',
    'Italianno',
    'LondrinaSolid',
    'Lato',
    'MankSans',
    'Market Fresh',
    'Mostery',
    'Play',
    'Poppins',
    'Roboto',
    'Rodano',
    'Sriracha',
    'Trocchi'
  ];
  List<Map<String, dynamic>> letters = [
    {'type': SvgPath.bold, 'apply': false},
    {'type': SvgPath.italic, 'apply': false},
    {'type': SvgPath.underline, 'apply': false}
  ];
  List<String> cases = ['Aa', 'AA', 'aa'];
  List<int> fontSize = [10, 12, 14, 16, 18, 20, 22, 24, 36, 48, 64, 72];
  List<Map<String, dynamic>> frameDetails = [
    {
      "imageList": SvgPath.frameLogo,
      "add": SvgPath.sticker1,
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
  List<EditableItem> editableItem = [];
  EditableItem activeEditableItem = EditableItem();

  List<Map<String, dynamic>> stickerList = [
    {
      "label": "All",
      "imageList": [SvgPath.sticker4, SvgPath.sticker1, SvgPath.sticker10, SvgPath.sticker1, SvgPath.sticker2]
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
  final GlobalKey repaintBoundaryKey = GlobalKey();

  void setSelectedFontFamily(String fontFamily) {
    selectedFontFamily = fontFamily;
    notifyListeners();
  }

  void setSelectedFontSize(int fontsize) {
    selectedFontSize = fontsize;
    notifyListeners();
  }

  void onColorChange(Color color) {
    selectedColor = color;
    notifyListeners();
  }

  void onColorOpacityChange(double opacity) {
    selectedColor = selectedColor.withOpacity(opacity);
    notifyListeners();
  }

  void toggleTextStyle(int index) {
    selectedTextStyle = index.toString();
    letters[index]['apply'] = !letters[index]['apply'];
    debugPrint("${letters[index]['apply']}");
    if (selectedTextStyle == '0') {
      isBold = !isBold;
    } else if (selectedTextStyle == '1') {
      isItalic = !isItalic;
    } else if (selectedTextStyle == '2') {
      isUnderline = !isUnderline;
    }
    notifyListeners();
  }

  void toggleTextCase(String selectedCase, int index) {
    selectedCaseIndex = index.toString();
    if (selectedCase == 'AA') {
      selectedTextCase = 'AA';
      isUppercase = true;
    }
    if (selectedCase == 'Aa') {
      selectedTextCase = 'Aa';
      isUppercase = false;
    }
    if (selectedCase == 'aa') {
      selectedTextCase = 'aa';
      isUppercase = false;
    }
    notifyListeners();
  }

  void edit({required int index, required BuildContext context, required ImageEditProvider provider}) async {
    currentIndex = index.toString();
    notifyListeners();

    if (index == 0) {
      String text = '';
      String? result = await showDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.3),
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 0.3, sigmaY: 0.3, tileMode: TileMode.decal),
            child: Dialog(
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
                      child: SvgPicture.asset(SvgPath.cancel),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                      decoration: BoxDecoration(
                        color: ColorRef.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorRef.black000000, fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 20),
                        decoration: InputDecoration(
                          hintText: 'Write Here',
                          contentPadding: EdgeInsets.zero,
                          hintStyle: TextStyle(color: ColorRef.black000000),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) => text = value,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        if (text.isNotEmpty) {
                          editableItem.add(EditableItem(editWidget: Text(text)));
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 90),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: ColorRef.yellowFFA500,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('Done', style: TextStyle(color: ColorRef.black202020)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else if (index == 1) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return StickerBottomSheet(provider: provider);
            },
          );
        },
      );
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
      h = height / 1.3;
      w = width / 3.2;
    } else if (height > 800 && width > 370) {
      debugPrint("Large device");
      h = height / 2.26;
      w = width / 3.66;
    }
    activeItem['left'] += (details.delta.dx);
    activeItem['top'] += (details.delta.dy);
    debugPrint("$height $width ${height / 1.3} $details");
    activeItem['left'] = (activeItem['left'] as double).clamp(2, 50);
    activeItem['top'] = (activeItem['top'] as double).clamp(2, 50);
    notifyListeners();
  }

  onScreenTap() {
    inAction = false;
    activeEditableItem = EditableItem();
    notifyListeners();
  }

  onWidgetTap({required BuildContext context, required ImageEditProvider provider}) {
    inAction = true;
    if (activeEditableItem.editWidget.runtimeType == Text) {
      showModalBottomSheet(
        context: context,
        backgroundColor: ColorRef.transparent,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return EditingBottomSheet(provider: provider);
            },
          );
        },
      );
    }
    notifyListeners();
  }

  onPointerUp() {
    inAction = false;
    notifyListeners();
  }

  onPointerDown({required PointerDownEvent details, required EditableItem data}) {
    if (inAction) return;
    inAction = true;
    activeEditableItem = data;
    /*activeItem = data;
    currentScale = data['scale'];
    currentRotation = data['rotation'];*/
    notifyListeners();
  }

  onScaleStart(details) {
    currentScale = activeEditableItem.scale;
    currentRotation = activeEditableItem.rotation;
    notifyListeners();
  }

  onScaleUpdate(ScaleUpdateDetails details, height, width) {
    if (activeEditableItem.editWidget == null) {
      return;
    }
    debugPrint("$activeItem");
    double h = 0, w = 0;
    if (height < 750 && width < 370) {
      debugPrint("Small device");
      h = height / 2.60;
      w = width / 1.45;
    } else if (height < 800 && width < 370) {
      debugPrint("Medium device");
      h = height / 3.05;
      w = width / 3.30;
    } else if (height > 800 && width > 370) {
      debugPrint("Large device");
      h = height / 1.56;
      w = width / 2.0;
    }
    debugPrint("$height $width $w");
    /*activeItem['left'] += (details.focalPointDelta.dx);
    activeItem['top'] += (details.focalPointDelta.dy);
    activeItem['left'] = (activeItem['left'] as double).clamp(2, width - w);
    activeItem['top'] = (activeItem['top'] as double).clamp(2, 280);
    activeItem['position'] = Offset(activeItem['left'].toDouble(), activeItem['top'].toDouble());
    activeItem['rotation'] = details.rotation + currentRotation!;
    double scale = max(min(details.scale * currentScale!, 2), 0.3);
    activeItem['scale'] = scale;*/
    activeEditableItem.left = (details.focalPointDelta.dx) + activeEditableItem.left!.toDouble();
    activeEditableItem.top = (details.focalPointDelta.dy) + activeEditableItem.top!.toDouble();
    activeEditableItem.left = activeEditableItem.left!.clamp(2, w).toDouble(); //112
    activeEditableItem.top = activeEditableItem.top!.clamp(2, h).toDouble(); //260
    activeEditableItem.position = Offset(activeEditableItem.left!.toDouble(), activeEditableItem.top!.toDouble());
    activeEditableItem.rotation = details.rotation + currentRotation!;
    double scale = max(min(details.scale * currentScale!, 20), 0.3);
    activeEditableItem.scale = scale;
    debugPrint("${activeEditableItem.scale}");
    notifyListeners();
  }

  void onBack() {
    NavigationService.goBack();
  }

  void onSelectSticker({required int index}) {
    stickerIndex = index;
    stickerViewIndex = 0;
    notifyListeners();
  }

  onChangeStickerView() {
    stickerViewIndex = 1;
    notifyListeners();
  }

  void onCheck() {
    NavigationService.replaceToNamed('downloadPost');
    notifyListeners();
  }

  File? capturedImageData;

  Future<Uint8List?> captureEditedImage() async {
    RenderRepaintBoundary boundary = repaintBoundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    NavigationService.routeTo(MaterialPageRoute(builder: (context) => DownloadPostView(imageData: byteData?.buffer.asUint8List())));
    return byteData?.buffer.asUint8List();
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
        customText: customText ?? customText,
      );
}
