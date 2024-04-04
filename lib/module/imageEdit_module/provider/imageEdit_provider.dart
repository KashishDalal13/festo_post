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
  int selectedFontSize = 22;
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
      "apply":false,
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
      "apply":false,
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
      "apply":false,
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
      "apply":false,
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
      "apply":false,
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
      ],
      "imageUrl":"https://i.pinimg.com/originals/cb/96/46/cb9646aec074be5acb1ea77ddc71c0e3.jpg"
    },
    {
      "label": "Sale",
      "imageList": [SvgPath.sticker3, SvgPath.sticker5, SvgPath.sticker7],
      "imageUrl":"https://i.pinimg.com/originals/cb/96/46/cb9646aec074be5acb1ea77ddc71c0e3.jpg"
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
      "audios":[
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
  final AudioPlayer audioPlayer = AudioPlayer(); // Ensure this is from just_audio package
  bool isPlaying = false;
  int playingIndex=0;


  void togglePlayback(int index) {
    if (isPlaying) {
      audioPlayer.pause();
      playingIndex=index;
    } else {
      audioPlayer.play();
      playingIndex=index;
    }
    isPlaying = !isPlaying;
    notifyListeners();
  }

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

  void onColorOpacityChange(double opacity, CustomItem item) {
    selectedColor = selectedColor.withOpacity(opacity);
    item.textStyle = TextStyle(color: selectedColor.withOpacity(opacity));
    notifyListeners();
  }

  void toggleTextStyle(int index, CustomItem item) {
    selectedTextStyle = index.toString();
    letters[index]['apply'] = !letters[index]['apply'];
    debugPrint("${letters[index]['apply']}");
    if (selectedTextStyle == '0') {
      isBold = !isBold;
      if (isBold) {
        item.textStyle = const TextStyle(fontWeight: FontWeight.w900);
      } else {
        item.textStyle = const TextStyle(fontWeight: FontWeight.w400);
      }
    } else if (selectedTextStyle == '1') {
      isItalic = !isItalic;
      if (isItalic) {
        item.textStyle = const TextStyle(fontStyle: FontStyle.italic);
      } else {
        item.textStyle = const TextStyle(fontStyle: FontStyle.normal);
      }
    } else if (selectedTextStyle == '2') {
      isUnderline = !isUnderline;
      if (isUnderline) {
        item.textStyle = const TextStyle(decoration: TextDecoration.underline);
      } else {
        item.textStyle = const TextStyle(decoration: TextDecoration.none);
      }
    }
    notifyListeners();
  }

  void toggleTextCase(String selectedCase, int index, CustomItem item) {
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

  void edit(
      {required int index,
      required BuildContext context,
      required ImageEditProvider provider}) async {
    currentIndex = index.toString();
    notifyListeners();

    if (index == 0) {
      String text = '';
      String? result = await showDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.3),
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ui.ImageFilter.blur(
                sigmaX: 0.3, sigmaY: 0.3, tileMode: TileMode.decal),
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
                            color: BoolRef.themeChange
                                ? ColorRef.black202020
                                : ColorRef.whiteFFFFFF,
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                            alignment: Alignment.center,
                            onPressed: () => provider.onBack(),
                            icon: Icon(
                              Icons.close,
                              size: 18,
                              color: BoolRef.themeChange
                                  ? ColorRef.whiteFFFFFF
                                  : ColorRef.black202020,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 10),
                      decoration: BoxDecoration(
                        color: BoolRef.themeChange
                            ? ColorRef.black202020.withOpacity(0.7)
                            : ColorRef.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorRef.textPrimaryColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Lato',
                            fontSize: 20),
                        decoration: InputDecoration(
                          hintText: 'Write Here',
                          contentPadding: EdgeInsets.zero,
                          hintStyle:
                              TextStyle(color: ColorRef.textPrimaryColor),
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
                        child: Text('Done',
                            style: TextStyle(color: ColorRef.black202020)),
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
          ),
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
    activeItem['position'] =
        Offset(activeItem['left'].toDouble(), activeItem['top'].toDouble());
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
    RenderRepaintBoundary boundary = repaintBoundaryKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    NavigationService.routeTo(MaterialPageRoute(
        builder: (context) =>
            DownloadPostView(imageData: byteData?.buffer.asUint8List())));
    return byteData?.buffer.asUint8List();
  }

  List<CustomItem> items = [];

  void updateItemTextStyle(String id, TextStyle newTextStyle) {
    debugPrint("$items");
    final index = items.indexWhere((item) => item.id == id);
    if (index != -1) {
      items[index] = items[index].copyWith(textStyle: newTextStyle);
      notifyListeners();
    }
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
    this.editWidget,
    this.textStyle,
    Future<bool> Function()? onDel,
    int? id,
  }) : super(
          child: const Text(''),
          onDel: onDel,
          id: id,
        ) {
    // Ensure that each CustomItem has its own instance of TextStyle
    this.textStyle = textStyle?.copyWith();
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
  TextStyle? textStyle; // TextStyle property

  @override
  CustomItem copyWith({
    CaseStyle? caseStyle,
    Widget? child,
    int? id,
    String? imageList,
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
  }) =>
      CustomItem(
        onDel: onDel ?? this.onDel,
        id: id ?? this.id,
        customText: customText ?? this.customText,
        imageList: imageList ?? this.imageList,
        add: add ?? this.add,
        show: show ?? this.show,
        position: position ?? this.position,
        top: top ?? this.top,
        left: left ?? this.left,
        scale: scale ?? this.scale,
        rotation: rotation ?? this.rotation,
        editWidget: editWidget ?? this.editWidget,
        textStyle: textStyle ?? this.textStyle,
      )..textStyle = textStyle?.copyWith();
}
