import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:festo_post/module/imageEdit_module/provider/imageEdit_provider.dart';
import 'package:festo_post/utils/colors.dart';
import 'package:festo_post/utils/string.dart';
import 'package:stack_board/stack_board.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import '../../../utils/bool.dart';

class ImageEditView extends StatelessWidget {
  ImageEditView({
    Key? key,
    this.label,
    this.selectedImage,
  }) : super(key: key);

  String? label;
  String? selectedImage;

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
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
                          width: 350, // or provide your desired width
                          height: 370,
                          child: StackBoard(
                            key: provider.boardKey,
                            controller: provider.boardController,
                            caseStyle: const CaseStyle(
                              borderColor: Colors.grey,
                              iconColor: Colors.white,
                            ),
                            customBuilder: (StackBoardItem t) {
                              if (t is CustomItem) {
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
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return StatefulBuilder(
                                            builder: (context, setState) {
                                              return Container(
                                                height: 230,
                                                decoration: BoxDecoration(
                                                  borderRadius: const BorderRadius.only(
                                                    topLeft: Radius.circular(30.0),
                                                    topRight: Radius.circular(30.0),
                                                  ),
                                                  color: ColorRef.greyEDEDED,
                                                ),
                                                child: Column(
                                                  children: <Widget>[
                                                    const SizedBox(height: 15),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          StrRef.editText,
                                                          style: const TextStyle(
                                                            fontSize: 15,
                                                            fontFamily: 'Lato',
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 15),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                height: 35,
                                                                width: 140,
                                                                padding: const EdgeInsets.all(2),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(5),
                                                                  color: ColorRef.white,
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    SvgPicture.asset(SvgPath.leftArrow),
                                                                    Text(
                                                                      StrRef.Fonts,
                                                                      style: const TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w400),
                                                                    ),
                                                                    SvgPicture.asset(SvgPath.rightArrow),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                                                child: SizedBox(
                                                                  height: 35,
                                                                  child: ListView.separated(
                                                                    scrollDirection: Axis.horizontal,
                                                                    itemCount: provider.letters.length,
                                                                    separatorBuilder: (context, index) => const SizedBox(width: 15),
                                                                    itemBuilder: (context, index) {
                                                                      return GestureDetector(
                                                                        onTap: () {
                                                                          setState(() {
                                                                            provider.toggleTextStyle(provider.letters[index], index);
                                                                          }); // Update the UI
                                                                        },
                                                                        child: Container(
                                                                          height: 35,
                                                                          width: 35,
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(5),
                                                                            color: (provider.selectedTextStyle == index.toString() &&
                                                                                    (provider.isBold || provider.isUnderline || provider.isItalic))
                                                                                ? ColorRef.yellowFFA500
                                                                                : ColorRef.white,
                                                                          ),
                                                                          child: Center(
                                                                            child: Text(
                                                                              provider.letters[index],
                                                                              style: const TextStyle(
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 92,
                                                          child: VerticalDivider(
                                                            color: ColorRef.greyD9D9D9,
                                                            thickness: 1,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                height: 35,
                                                                width: 140,
                                                                padding: const EdgeInsets.all(2),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(5),
                                                                  color: ColorRef.white,
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap: () {
                                                                        provider.increaseFontSize();
                                                                        setState(() {});
                                                                      },
                                                                      child: SvgPicture.asset(SvgPath.plus),
                                                                    ),
                                                                    Text(
                                                                      '${provider.fontSize.toInt()}',
                                                                      style: const TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w400),
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap: () {
                                                                        provider.decreaseFontSize();
                                                                        setState(() {});
                                                                      },
                                                                      child: SvgPicture.asset(SvgPath.minus),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                                                child: SizedBox(
                                                                  height: 35,
                                                                  child: ListView.separated(
                                                                    scrollDirection: Axis.horizontal,
                                                                    itemCount: provider.cases.length,
                                                                    separatorBuilder: (context, index) => const SizedBox(width: 15),
                                                                    itemBuilder: (context, index) {
                                                                      return GestureDetector(
                                                                        onTap: () {
                                                                          setState(() {
                                                                            provider.toggleTextCase(provider.cases[index], index);
                                                                          }); // Update the UI
                                                                        },
                                                                        child: Container(
                                                                          height: 35,
                                                                          width: 35,
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(5),
                                                                            color: provider.selectedCaseIndex == index.toString() ? ColorRef.yellowFFA500 : ColorRef.white,
                                                                          ),
                                                                          child: Center(
                                                                            child: Text(
                                                                              provider.cases[index],
                                                                              style: const TextStyle(
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 15),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        // Make sure to import necessary packages and classes

                                                        GestureDetector(
                                                          onTap: () {
                                                            showDialog(
                                                              context: context,
                                                              builder: (BuildContext context) {
                                                                return Padding(
                                                                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                                                  child: Dialog(
                                                                    insetPadding: const EdgeInsets.all(10),
                                                                    backgroundColor: Color(0xffEDEDED),
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(5.0),
                                                                    ),
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(20.0),
                                                                      child: GridView.builder(
                                                                        shrinkWrap: true,
                                                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                          crossAxisCount: 6,
                                                                          crossAxisSpacing: 10,
                                                                          mainAxisSpacing: 10,
                                                                        ),
                                                                        itemCount: provider.colors.length,
                                                                        itemBuilder: (BuildContext context, int index) {
                                                                          Color color = provider.colors[index];
                                                                          return GestureDetector(
                                                                            onTap: () {
                                                                              provider.onColorChange(color);
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child: Container(
                                                                              height: 40,
                                                                              width: 40,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(2),
                                                                                color: color,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Container(
                                                                height: 40,
                                                                width: 40,
                                                                decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(10),
                                                                ),
                                                                child: Image.asset(SvgPath.colorWheel), // Make sure SvgPath.colorWheel is defined
                                                              ),
                                                              const SizedBox(width: 10),
                                                              SizedBox(
                                                                height: 40,
                                                                width: 40 * 5,
                                                                child: ListView.separated(
                                                                  scrollDirection: Axis.horizontal,
                                                                  itemCount: 5,
                                                                  separatorBuilder: (BuildContext context, int index) {
                                                                    return const SizedBox(width: 10);
                                                                  },
                                                                  itemBuilder: (BuildContext context, int index) {
                                                                    double opacity = index < provider.shadeOpacities.length ? provider.shadeOpacities[index] : 0.0;
                                                                    return Container(
                                                                      height: 40,
                                                                      width: 40,
                                                                      decoration: BoxDecoration(
                                                                        color: provider.selectedColor.withOpacity(opacity),
                                                                        borderRadius: BorderRadius.circular(10),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
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
                                          fontSize: provider.fontSize,
                                          fontWeight: provider.isBold ? FontWeight.bold : FontWeight.normal,
                                          fontStyle: provider.isItalic ? FontStyle.italic : FontStyle.normal,
                                          decoration: provider.isUnderline ? TextDecoration.underline : TextDecoration.none,
                                          fontFamily: 'Lato',
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return null;
                            },
                            background: Container(
                              alignment: Alignment.center,
                              child: Image.asset(selectedImage ?? "", height: 350, width: 370, fit: BoxFit.cover),
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
                                      child: Container(child: Image.asset(e['add'])),
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
                                provider.edit(index: index, context: context);
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
