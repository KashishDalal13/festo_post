import 'dart:ui';

import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

import '../../../app_export.dart';

class ImageEditView extends StatelessWidget {
  final String? label;
  final String? selectedImage;

  const ImageEditView({Key? key, this.label, this.selectedImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey repaintBoundaryKey = GlobalKey();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (BuildContext context) => ImageEditProvider(),
      builder: (context, child) {
        ImageEditProvider provider = context.watch<ImageEditProvider>();
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorRef.white,
              surfaceTintColor: ColorRef.white,
              leading: IconButton(
                onPressed: () => provider.onBack(),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 24,
                  color: BoolRef.themeChange ? ColorRef.white : ColorRef.black202020,
                ),
              ),
              centerTitle: true,
              title: Text(label ?? '', style: const TextStyle(fontSize: 20, fontFamily: 'Lato', fontWeight: FontWeight.w400)),
              actions: [
                TextButton(
                  onPressed: () async {
                    RenderRepaintBoundary boundary = repaintBoundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
                    final image = await boundary.toImage(pixelRatio: 3);
                    final directory = (await getApplicationDocumentsDirectory()).path;
                    final byteData = (await image.toByteData(format: ui.ImageByteFormat.png))!;
                    final pngBytes = byteData.buffer.asUint8List();
                    final imgFile = File('$directory/${DateTime.now()}.png');
                    await imgFile.writeAsBytes(pngBytes);
                    // ui.Image image = await boundary.toImage(pixelRatio: 10.0);
                    // ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
                    // Uint8List? imageData = byteData?.buffer.asUint8List();
                    provider.captureEditedImage(imgFile);
                  },
                  child: Icon(Icons.check, size: 24, color: ColorRef.blue0250A4),
                ),
              ],
            ),
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  GestureDetector(
                    onScaleStart: (details) => provider.onScaleStart(details),
                    onScaleUpdate: (details) => provider.onScaleUpdate(details, height, width),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 350,
                          height: 350,
                          child: StackBoard(
                            key: provider.boardKey,
                            controller: provider.boardController,
                            caseStyle: const CaseStyle(borderColor: Colors.grey, iconColor: Colors.white, boxAspectRatio: 2),
                            customBuilder: (StackBoardItem t) {
                              if (t is CustomItem) {
                                debugPrint("StackBoardItem${t.id}");
                                return ItemCase(
                                  key: Key('StackBoardItem${t.id}'),
                                  isCenter: false,
                                  onDel: () async => provider.boardController.remove(t.id),
                                  onTap: () => provider.boardController.moveItemToTop(t.id),
                                  caseStyle: const CaseStyle(
                                    borderColor: Colors.grey,
                                    iconColor: Colors.white,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      provider.currentItemId = t.id.toString();
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
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        provider.selectedTextCase == 'AA'
                                            ? (t.customText ?? '').toUpperCase()
                                            : provider.selectedTextCase == 'aa'
                                                ? t.customText!.toLowerCase()
                                                : "${t.customText!.substring(0, 1).toUpperCase()}${t.customText!.substring(1).toLowerCase()}",
                                        style: TextStyle(
                                          color: provider.selectedColor,
                                          fontSize: provider.selectedFontSize.toDouble(),
                                          fontWeight: provider.isBold ? FontWeight.bold : FontWeight.normal,
                                          fontStyle: provider.isItalic ? FontStyle.italic : FontStyle.normal,
                                          decoration: provider.isUnderline ? TextDecoration.underline : TextDecoration.none,
                                          fontFamily: provider.selectedFontFamily,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return null;
                            },
                            background: RepaintBoundary(
                              key: repaintBoundaryKey,
                              child: Stack(
                                children: [
                                  Image.asset(selectedImage ?? "", height: 350, width: 370, fit: BoxFit.cover),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.only(top: 16.0, right: 19.0),
                                              child: Image.asset(SvgPath.logo),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              const SizedBox(height: 5),
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: ColorRef.blue007494,
                                                  borderRadius: const BorderRadius.only(
                                                    topLeft: Radius.circular(30.0),
                                                    bottomLeft: Radius.circular(30.0),
                                                  ),
                                                ),
                                                child: Text(
                                                  "Loopbots@gmail.com",
                                                  style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 8, color: ColorRef.white),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: ColorRef.red8C0016,
                                                  borderRadius: const BorderRadius.only(
                                                    topLeft: Radius.circular(30.0),
                                                    bottomLeft: Radius.circular(30.0),
                                                  ),
                                                ),
                                                child: Text(
                                                  "+12 123 456 789",
                                                  style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 8, color: ColorRef.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 2),
                                              decoration: BoxDecoration(
                                                color: ColorRef.red8C0016,
                                                borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(30.0),
                                                  bottomLeft: Radius.circular(30.0),
                                                ),
                                              ),
                                              child: Text(
                                                "www.loopbotstechnology.com",
                                                style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 8, color: ColorRef.white),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 3),
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                color: ColorRef.blue007494,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "401 - Green Elina, Anand mahal road, Adajan. Surat, Gujarat 395009",
                                                  style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 6, color: ColorRef.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        ...provider.frameDetails.map(
                          (e) {
                            if (e["show"] == true) {
                              return Positioned(
                                top: e['top'].toDouble(),
                                // Convert int to double
                                left: e['left'].toDouble(),
                                // Convert int to double
                                child: Transform.scale(
                                  scale: e['scale'],
                                  child: Transform.rotate(
                                    angle: e['rotation'],
                                    child: Listener(
                                      onPointerDown: (details) => provider.onPointerDown(details, e),
                                      onPointerUp: (details) => provider.onPointerUp(),
                                      child: Image.asset(e['add']),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 106,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: provider.frameDetails.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                provider.frameDetailsdisplay(index: index);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                                // height: 50,
                                // width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: const Offset(0, 1),
                                      ),
                                    ],
                                    color: ColorRef.greyEDEDED),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SvgPicture.asset(
                                    provider.frameDetails[index]['imageList'],
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 5);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Container(
                      width: 370,
                      height: 81,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorRef.greyEDEDED),
                      child: Center(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: provider.EditDetails.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                provider.edit(index: index, context: context, provider: provider);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10.0),
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: ColorRef.white),
                                    child: SvgPicture.asset(
                                      provider.EditDetails[index]['image'],
                                    ),
                                  ),
                                  Text(provider.EditDetails[index]['label'] ?? '',
                                      style: const TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 12)) // Add null check here
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 5);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
