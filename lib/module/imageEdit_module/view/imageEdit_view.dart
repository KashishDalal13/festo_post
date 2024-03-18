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
  double _fontSize = 15;
  bool _isBold = false;
  bool _isItalic = false;
  bool _isUnderline = false;
  Color _textColor = Colors.black;

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
                  color: BoolRef.themeChange
                      ? ColorRef.white
                      : ColorRef.black202020,
                ),
              ),
              centerTitle: true,
              title: Text(label ?? '',
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400)),
              actions: [
                TextButton(
                  onPressed: () {},
                  child:
                      Icon(Icons.check, size: 24, color: ColorRef.blue0250A4),
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
                    onScaleUpdate: (details) =>
                        provider.onScaleUpdate(details, height, width),
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
                                  onDel: () async =>
                                      provider.boardController.remove(t.id),
                                  onTap: () => provider.boardController
                                      .moveItemToTop(t.id),
                                  caseStyle: const CaseStyle(
                                    borderColor: Colors.grey,
                                    iconColor: Colors.white,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: 230,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(30.0),
                                                      topRight: Radius.circular(
                                                          30.0)),
                                              color: ColorRef.greyD6D6D6,
                                            ),
                                            child: Column(
                                              children: <Widget>[
                                                const SizedBox(height: 15),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      StrRef.editText,
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontFamily: 'Lato',
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: ColorRef
                                                                    .white),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                SvgPicture.asset(
                                                                    SvgPath
                                                                        .leftArrow),
                                                                Text('Fonts'),
                                                                SvgPicture.asset(
                                                                    SvgPath
                                                                        .rightArrow),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Container(
                                                                height: 35,
                                                                width: 35,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    color: ColorRef
                                                                        .white),
                                                              ),
                                                              Container(
                                                                height: 35,
                                                                width: 35,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    color: ColorRef
                                                                        .white),
                                                              ),
                                                              Container(
                                                                height: 35,
                                                                width: 35,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    color: ColorRef
                                                                        .white),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const VerticalDivider(
                                                      color: Colors.black,
                                                      thickness: 40,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: 35,
                                                            width: 140,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(2),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: ColorRef
                                                                    .white),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                SvgPicture.asset(
                                                                    SvgPath
                                                                        .plus),
                                                                Text('15'),
                                                                SvgPicture.asset(
                                                                    SvgPath
                                                                        .minus),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Container(
                                                                height: 35,
                                                                width: 35,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    color: ColorRef
                                                                        .white),
                                                              ),
                                                              Container(
                                                                height: 35,
                                                                width: 35,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    color: ColorRef
                                                                        .white),
                                                              ),
                                                              Container(
                                                                height: 35,
                                                                width: 35,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    color: ColorRef
                                                                        .white),
                                                              ),
                                                            ],
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
                                    child: Container(
                                      width: 100,
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        t.customText ?? '',
                                        style: TextStyle(
                                            color: ColorRef.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Lato'),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return null;
                            },
                            background: Container(
                              alignment: Alignment.center,
                              child: Image.asset(selectedImage ?? "",
                                  height: 350, width: 370, fit: BoxFit.cover),
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
                                      onPointerDown: (details) =>
                                          provider.onPointerDown(details, e),
                                      onPointerUp: (details) =>
                                          provider.onPointerUp(),
                                      child: Container(
                                          child: Image.asset(e['add'])),
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
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 20),
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorRef.greyEDEDED),
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
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: ColorRef.white),
                                    child: SvgPicture.asset(
                                      provider.EditDetails[index]['image'],
                                    ),
                                  ),
                                  Text(
                                      provider.EditDetails[index]['label'] ??
                                          '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Lato',
                                          fontSize: 12)) // Add null check here
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
