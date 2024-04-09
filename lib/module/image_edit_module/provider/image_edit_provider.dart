import 'dart:ui' as ui;

import 'package:festo_post/app_export.dart';

class ImageEditProvider extends ChangeNotifier {
  int audioIndex = 0;
  String framecurrentIndex = "";
  String currentItemId = "", currentIndex = "";
  int stickerIndex = 0, stickerViewIndex = 0;
  StackBoardController boardController = StackBoardController();
  final GlobalKey boardKey = GlobalKey();
  bool isBold = false;
  bool isItalic = false;
  bool isUnderline = false;
  double selectedFontSize = 22.0;
  Color selectedColor = const Color(0xff505050);
  List<double> shadeOpacities = [0.7, 0.6, 0.5, 0.4, 0.3, 0.2];

  double itemLeft = 0;
  double itemTop = 0;
  double itemWidth = 100;
  double itemHeight = 100;

  double boundaryLeft = 0;
  double boundaryTop = 0;
  double boundaryRight = 300;
  double boundaryBottom = 300;

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
  List<double> fontSize = [10.0, 12.0, 14.0, 16.0, 18.0, 20.0, 22.0, 24.0, 36.0, 48.0, 64.0, 72.0];
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
      "apply": false,
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
      "apply": false,
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
      "apply": false,
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
      "apply": false,
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
      "apply": false,
    },
  ];
  List<Map<String, dynamic>> editDetails = [
    {"image": SvgPath.text, "label": "Text"},
    {"image": SvgPath.sticker, "label": "Sticker"},
    {"image": SvgPath.imageGallery, "label": "Image"},
    {"image": SvgPath.volume, "label": "Audio"},
  ];

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

  List<Map<String, dynamic>> audioList = [
    {
      "label": "All",
      "audios": [
        {"image": SvgPath.trend1, "audio": SvgPath.audio1, "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": SvgPath.audio2, "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": SvgPath.audio3, "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": SvgPath.audio4, "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": SvgPath.audio1, "duration": "10.0"},
      ]
    },
    {
      "label": "BirthDay",
      "audios": [
        {"image": SvgPath.trend1, "audio": "BirthDay", "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": "BirthDay", "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": "BirthDay", "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": "nature", "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": "nature", "duration": "10.0"},
      ]
    },
    {
      "label": "Celebration",
      "audios": [
        {"image": SvgPath.trend1, "audio": "Celebration", "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": "Celebration", "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": "Celebration", "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": "Celebration", "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": "Celebration", "duration": "10.0"},
      ]
    },
    {
      "label": "Offer",
      "audios": [
        {"image": SvgPath.trend1, "audio": "Offer", "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": "Offer", "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": "Offer", "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": "Offer", "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": "nature", "duration": "10.0"},
      ]
    },
    {
      "label": "Religious",
      "audios": [
        {"image": SvgPath.trend1, "audio": "Religious", "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": "Religious", "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": "Religious", "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": "Religious", "duration": "10.0"},
        {"image": SvgPath.trend1, "audio": "nature", "duration": "10.0"},
      ]
    },
  ];
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  int playingIndex = 0;

  void togglePlayback(int index) {
    if (isPlaying) {
      audioPlayer.pause();
      playingIndex = index;
    } else {
      audioPlayer.play();
      playingIndex = index;
    }
    isPlaying = !isPlaying;
    notifyListeners();
  }

  final GlobalKey repaintBoundaryKey = GlobalKey();

  void setSelectedFontFamily(String fontFamily) {
    selectedFontFamily = fontFamily;
    notifyListeners();
  }

  void setSelectedFontSize(double fontSize) {
    selectedFontSize = fontSize;
    notifyListeners();
  }

  void onColorChange(Color color, CustomItem item) {
    selectedColor = color;
    item.color = selectedColor;
    notifyListeners();
  }

  void onColorOpacityChange(double opacity, CustomItem item) {
    selectedColor = selectedColor.withOpacity(opacity);
    item.color = selectedColor.withOpacity(opacity);
    notifyListeners();
  }

  void toggleTextStyle(int index, CustomItem item) {
    selectedTextStyle = index.toString();
    debugPrint("${letters[index]['apply']}");

    if (selectedTextStyle == '0') {
      letters[index]['apply'] = !letters[index]['apply'];
      if (letters[index]['apply']) {
        item.fontWeight = FontWeight.bold;
      } else {
        item.fontWeight = FontWeight.w400;
      }
    } else if (selectedTextStyle == '1') {
      letters[index]['apply'] = !letters[index]['apply'];
      if (letters[index]['apply']) {
        debugPrint("1");
        item.fontStyle = FontStyle.italic;
      } else {
        debugPrint("2 ");
        item.fontStyle = FontStyle.normal;
      }
    } else if (selectedTextStyle == '2') {
      letters[index]['apply'] = !letters[index]['apply'];
      if (letters[index]['apply']) {
        item.decoration = TextDecoration.underline;
      } else {
        item.decoration = TextDecoration.none;
      }
    }
    notifyListeners();
  }

  void toggleTextCase(String selectedCase, int index, CustomItem item) {
    selectedCaseIndex = index.toString();
    if (selectedCase == 'AA') {
      selectedTextCase = 'AA';
      item.styleCase = selectedCase;
      isUppercase = true;
    }
    if (selectedCase == 'Aa') {
      selectedTextCase = 'Aa';
      item.styleCase = selectedCase;
      isUppercase = false;
    }
    if (selectedCase == 'aa') {
      selectedTextCase = 'aa';
      item.styleCase = selectedCase;
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
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          // margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: BoolRef.themeChange ? ColorRef.black202020 : ColorRef.whiteFFFFFF,
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                            alignment: Alignment.center,
                            onPressed: () => provider.onBack(),
                            icon: Icon(
                              Icons.close,
                              size: 18,
                              color: BoolRef.themeChange ? ColorRef.whiteFFFFFF : ColorRef.black202020,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                      decoration: BoxDecoration(
                        color: BoolRef.themeChange ? ColorRef.black202020.withOpacity(0.7) : ColorRef.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorRef.textPrimaryColor, fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 20),
                        decoration: InputDecoration(
                          hintText: 'Write Here',
                          contentPadding: EdgeInsets.zero,
                          hintStyle: TextStyle(color: ColorRef.textPrimaryColor),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) => text = value,
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

      if (result != null) {
        boardController.add<CustomItem>(
          CustomItem(
              customText: result,
              onDel: () async => true,
              textStyle: TextStyle(
                  fontFamily: "Lato", fontSize: 25.0, color: ColorRef.black202020, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal, decoration: TextDecoration.none)),
        );
      }
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
    } else if (index == 3) {
      NavigationService.routeToNamed('audio');
    }
  }

  onSelectTrending({required int index}) {
    audioIndex = index;
    debugPrint("$index ${audioList[index]['audio']}");
    notifyListeners();
  }

  void frameDetailsdisplay({required int index}) {
    framecurrentIndex = index.toString();
    frameDetails[index]['show'] = !frameDetails[index]['show'];
    activeItem = frameDetails[index];
    notifyListeners();
  }

  void setBoundary(double left, double top, double right, double bottom) {
    boundaryLeft = left;
    boundaryTop = top;
    boundaryRight = right;
    boundaryBottom = bottom;
  }

  void onPanUpdate(DragUpdateDetails details, double width, double height) {
    // Calculate the boundaries for the text movement
    double minX = 0;
    double maxX = width - itemWidth; // Adjust as per your requirement
    double minY = 0;
    double maxY = height - itemHeight; // Adjust as per your requirement

    // Calculate the new position of the text after dragging
    double newX = itemLeft + details.delta.dx;
    double newY = itemTop + details.delta.dy;

    // Ensure the new position is within the boundaries
    newX = newX.clamp(minX, maxX);
    newY = newY.clamp(minY, maxY);

    // Update the position of the text
    itemLeft = newX;
    itemTop = newY;

    // Notify listeners about the changes
    notifyListeners();
  }

  onScreenTap() {
    inAction = false;
    // activeEditableItem = EditableItem();
    notifyListeners();
  }

  /* onWidgetTap({required BuildContext context, required ImageEditProvider provider, required EditableItem data}) {
      inAction = true;
      activeEditableItem = data;
      if (activeEditableItem.editWidget.runtimeType == Text) {
        showModalBottomSheet(
          context: context,
          backgroundColor: ColorRef.transparent,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return EditingBottomSheet(provider: provider, editableItem: data);
              },
            );
          },
        );
      }
      notifyListeners();
    }*/

  onPointerUp() {
    inAction = false;
    notifyListeners();
  }

  onPointerDown(details, data) {
    if (inAction) return;
    inAction = true;
    activeItem = data;
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
    if (activeItem.isEmpty) {
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
    debugPrint("$height $width");
    activeItem['left'] += (details.focalPointDelta.dx);
    activeItem['top'] += (details.focalPointDelta.dy);
    activeItem['left'] = (activeItem['left'] as double).clamp(2, width - w);
    activeItem['top'] = (activeItem['top'] as double).clamp(2, 280);
    activeItem['position'] = Offset(activeItem['left'].toDouble(), activeItem['top'].toDouble());
    activeItem['rotation'] = details.rotation + currentRotation!;
    double scale = max(min(details.scale * currentScale!, 2), 0.3);
    activeItem['scale'] = scale;
    debugPrint("$activeItem");
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
  CustomItem({
    this.customText,
    this.imageList,
    this.add,
    this.show,
    this.position,
    this.top,
    this.left,
    this.scale,
    this.rotation,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.decoration,
    this.editWidget,
    this.textStyle,
    this.styleCase,
    this.color,
    Future<bool> Function()? onDel,
    int? id,
  }) : super(child: const Text(''), onDel: onDel, id: id) {
    // Ensure that each CustomItem has its own instance of TextStyle
    textStyle = textStyle?.copyWith();
  }
  final String? customText;
  String? imageList;
  String? add;
  bool? show;
  Offset? position;
  double? top;
  double? left;
  double? scale;
  double? rotation;
  Widget? editWidget;
  String? fontFamily;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  TextDecoration? decoration;
  String? styleCase;
  double? fontSize;

  Color? color;
  TextStyle? textStyle; // TextStyle property

  @override
  CustomItem copyWith({
    CaseStyle? caseStyle,
    Widget? child,
    int? id,
    String? fontFamily,
    String? imageList,
    String? styleCase,
    String? add,
    bool? show,
    Offset? position,
    double? top,
    double? left,
    double? scale,
    double? rotation,
    Widget? editWidget,
    TextStyle? textStyle, // Include textStyle in copyWith
    Future<bool> Function()? onDel,
    dynamic Function(bool)? onEdit,
    bool? tapToEdit,
    Color? color,
    double? fontSize, // New property: font size
    FontWeight? fontWeight, // New property: font weight
    FontStyle? fontStyle, // New property: font style
    TextDecoration? decoration, // New property: text decoration
  }) =>
      CustomItem(
        onDel: onDel ?? this.onDel,
        id: id ?? this.id,
        customText: customText ?? customText,
        imageList: imageList ?? this.imageList,
        add: add ?? this.add,
        show: show ?? this.show,
        position: position ?? this.position,
        top: top ?? this.top,
        left: left ?? this.left,
        scale: scale ?? this.scale,
        fontFamily: fontFamily ?? this.fontFamily,
        fontSize: fontSize ?? this.fontSize,
        fontWeight: fontWeight ?? this.fontWeight,
        fontStyle: fontStyle ?? this.fontStyle,
        decoration: decoration ?? this.decoration,
        styleCase: styleCase ?? this.styleCase,
        color: color ?? this.color,
        rotation: rotation ?? this.rotation,
        editWidget: editWidget ?? this.editWidget,
        textStyle: TextStyle(
          // Update the TextStyle with new properties
          fontSize: fontSize ?? this.textStyle?.fontSize,
          fontWeight: fontWeight ?? this.textStyle?.fontWeight,
          fontStyle: fontStyle ?? this.textStyle?.fontStyle,
          color: color ?? this.textStyle?.color,
          decoration: decoration ?? this.textStyle?.decoration,
        ).merge(textStyle),
      );
}
