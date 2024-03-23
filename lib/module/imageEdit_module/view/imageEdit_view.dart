import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:festo_post/module/imageEdit_module/provider/imageEdit_provider.dart';
import 'package:festo_post/utils/colors.dart';
import 'package:festo_post/utils/string.dart';
import 'package:stack_board/stack_board.dart';

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
                          width: 350,
                          height: 350,
                          child: StackBoard(
                            key: provider.boardKey,
                            controller: provider.boardController,
                            caseStyle: const CaseStyle(
                              borderColor: Colors.grey,
                              iconColor: Colors.white,boxAspectRatio: 2
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
                                        backgroundColor: ColorRef.transparent,
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
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              PopupMenuButton(
                                                                constraints: const BoxConstraints(maxWidth: 200,minWidth: 200, minHeight: 100, maxHeight: 150),
                                                                shadowColor: ColorRef.black202020,
                                                                offset: const Offset(0, 0),
                                                                color: ColorRef.whiteFFFFFF,
                                                                position: PopupMenuPosition.over,
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                ),
                                                                itemBuilder: (BuildContext context) {
                                                                  return provider.fontFamilies.map((String fontFamily) {
                                                                    final bool isSelected = provider.selectedFontFamily == fontFamily;
                                                                    return CheckedPopupMenuItem(
                                                                      value: fontFamily,
                                                                      child: Container(
                                                                        decoration: BoxDecoration(
                                                                         color: isSelected ? ColorRef.blueEFF6FF : Colors.transparent,
                                                                          borderRadius: BorderRadius.circular(10),
                                                                        ),
                                                                        child: Row(
                                                                          children: <Widget>[
                                                                            Checkbox(
                                                                              value: isSelected,
                                                                              onChanged: (_) {},
                                                                              activeColor: ColorRef.blue1E75E5,
                                                                            ),
                                                                            Text(
                                                                              fontFamily,
                                                                              style: TextStyle(
                                                                                color: ColorRef.grey406110A,
                                                                                fontSize: 15,
                                                                                fontFamily: fontFamily,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }).toList();
                                                                },
                                                                onSelected: (String selectedFontFamily) {
                                                                  setState(() {
                                                                    provider.setSelectedFontFamily(selectedFontFamily);
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                      padding: const EdgeInsets.symmetric(vertical: 9),
                                                                      margin: const EdgeInsets.symmetric(horizontal: 25),
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(5),
                                                                        color: ColorRef.white,
                                                                      ),
                                                                      child: Center(
                                                                        child:
                                                                            Text(
                                                                              provider.selectedFontFamily == '' ? "Fonts" : provider.selectedFontFamily,
                                                                              style: const TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w400),
                                                                            ),
                                                                      ),
                                                                    ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                                                child: SizedBox(
                                                                  height: 35,
                                                                  width: 180,
                                                                  child:ListView.separated(
                                                                    scrollDirection: Axis.horizontal,
                                                                    itemCount: provider.letters.length,
                                                                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                                                                    itemBuilder: (context, index) {
                                                                      bool isBold = provider.isBold;
                                                                      bool isItalic = provider.isItalic;
                                                                      bool isUnderline = provider.isUnderline;
                                                                      bool isSelected = false;
                                                                      if (index==0 && isBold) {
                                                                        isSelected = true;
                                                                      } else if (index==1 && isItalic) {
                                                                        isSelected = true;
                                                                      } else if (index==2 && isUnderline) {
                                                                        isSelected = true;
                                                                      } else if (isBold && isItalic && isUnderline) {
                                                                        isSelected = true;
                                                                      }
                                                                      return GestureDetector(
                                                                        onTap: () {
                                                                          setState(() {
                                                                            provider.toggleTextStyle(index);
                                                                          });
                                                                        },
                                                                        child: Container(
                                                                          padding: const EdgeInsets.symmetric(horizontal:15),
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(5),
                                                                            color: isSelected ? ColorRef.yellowFFA500 : ColorRef.white,
                                                                          ),
                                                                          child: Center(
                                                                            child: SvgPicture.asset(
                                                                              provider.letters[index],
                                                                              height: 15,
                                                                              width: 15,
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
                                                              PopupMenuButton(
                                                                shadowColor: ColorRef.black202020,
                                                                color: ColorRef.whiteFFFFFF,
                                                                offset: const Offset(-1,-1),
                                                                padding: EdgeInsets.zero,
                                                                constraints: const BoxConstraints(maxWidth: 120,minWidth: 120, minHeight: 180, maxHeight: 180),
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                ),
                                                                itemBuilder: (BuildContext context) {
                                                                  return provider.fontSize.map((int fontFontSize) {
                                                                    return PopupMenuItem<int>(
                                                                      value: fontFontSize,
                                                                      child: Center(
                                                                        child: Text(
                                                                          fontFontSize.toString(),
                                                                          style: TextStyle(
                                                                            color: ColorRef.black202020,
                                                                            fontSize: 12,
                                                                            fontFamily: 'Lato',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }).toList();
                                                                },
                                                                onSelected: (int selectedFontSize) {
                                                                  setState(() {
                                                                    provider.setSelectedFontSize(selectedFontSize);
                                                                  });
                                                                },
                                                                child: Container(
                                                                  padding: const EdgeInsets.symmetric(vertical: 7),
                                                                  margin: const EdgeInsets.symmetric(horizontal: 25),
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(5),
                                                                    color: ColorRef.white,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                    children: [
                                                                      Text(
                                                                        provider.selectedFontSize.toString(),
                                                                        style: const TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w400),
                                                                      ),
                                                                      const Icon(Icons.keyboard_arrow_down_outlined)
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                                                child: SizedBox(
                                                                  height: 35,
                                                                  width: 165,
                                                                  child: ListView.separated(
                                                                    scrollDirection: Axis.horizontal,
                                                                    itemCount: provider.cases.length,
                                                                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                                                                    itemBuilder: (context, index) {
                                                                      return GestureDetector(
                                                                        onTap: () {
                                                                          setState(() {
                                                                            provider.toggleTextCase(provider.cases[index], index);
                                                                          });
                                                                        },
                                                                        child: Container(
                                                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(5),
                                                                            color: provider.selectedCaseIndex == index.toString() ? ColorRef.yellowFFA500 : ColorRef.white,
                                                                          ),
                                                                          child: Center(
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.all(3.0),
                                                                              child: Text(
                                                                                provider.cases[index],
                                                                                style: const TextStyle(
                                                                                  fontSize: 16,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontFamily: 'Lato',
                                                                                ),
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
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  showDialog(
                                                                    context: context,
                                                                    builder: (BuildContext context) {
                                                                      return Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                                                                        child: Dialog(
                                                                          insetPadding: const EdgeInsets.all(10),
                                                                          backgroundColor: ColorRef.greyEDEDED,
                                                                          shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(5.0),
                                                                          ),
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.all(25.0),
                                                                            child: GridView.builder(
                                                                              shrinkWrap: true,
                                                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                                crossAxisCount: 6,
                                                                                crossAxisSpacing: 12,
                                                                                mainAxisSpacing: 10,
                                                                              ),
                                                                              itemCount: provider.colors.length,
                                                                              itemBuilder: (BuildContext context, int index) {
                                                                                Color color = provider.colors[index];
                                                                                return GestureDetector(
                                                                                  onTap: () {
                                                                                    setState(() {
                                                                                      provider.onColorChange(color);
                                                                                      Navigator.pop(context);
                                                                                    });
                                                                                  },
                                                                                  child: Container(
                                                                                    padding: const EdgeInsets.all(5),
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(10),
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
                                                                });
                                                              },
                                                              child: Container(
                                                                height: 40,
                                                                width: 40,
                                                                decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(5),
                                                                ),
                                                                alignment: Alignment.center,
                                                                child: SvgPicture.asset(SvgPath.color_selection,height: 25,width: 25,)
                                                              ),
                                                            ),
                                                            const SizedBox(width: 10),
                                                            SizedBox(
                                                              height: 40,
                                                              width: 290,
                                                              child: ListView.separated(
                                                                scrollDirection: Axis.horizontal,
                                                                itemCount: provider.shadeOpacities.length,
                                                                separatorBuilder: (BuildContext context, int index) {
                                                                  return const SizedBox(width: 10);
                                                                },
                                                                itemBuilder: (BuildContext context, int index) {
                                                                  double opacity = provider.shadeOpacities[index];
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      setState(() {
                                                                        provider.onColorOpacityChange(opacity);
                                                                      });
                                                                    },
                                                                    child: Container(
                                                                      height: 40,
                                                                      width: 40,
                                                                      decoration: BoxDecoration(
                                                                        color: provider.selectedColor.withOpacity(opacity),
                                                                        borderRadius: BorderRadius.circular(5),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
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
                            background: Stack(
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
