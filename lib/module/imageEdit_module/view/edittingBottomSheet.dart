import 'dart:ui';

import 'package:festo_post/app_export.dart';

class EditingBottomSheet extends StatefulWidget {
  final ImageEditProvider? provider;
  final CustomItem? item;

  const EditingBottomSheet({super.key, this.provider, this.item});

  @override
  State<EditingBottomSheet> createState() => _EditingBottomSheetState();
}

class _EditingBottomSheetState extends State<EditingBottomSheet> {
  @override
  Widget build(BuildContext context) {
    ImageEditProvider provider = widget.provider!;
    CustomItem stackBoardItem = widget.item!;
    return Theme(
      data: BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
      child: Container(
        height: 230,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
          color: BoolRef.themeChange ? ColorRef.blue304359 : ColorRef.greyEDEDED,
        ),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(StrRef.editText, style: TextStyle(color: ColorRef.textPrimaryColor, fontSize: 15, fontFamily: 'Lato', fontWeight: FontWeight.w400)),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PopupMenuButton(
                        constraints: const BoxConstraints(maxWidth: 200, minWidth: 200, minHeight: 100, maxHeight: 150),
                        shadowColor: ColorRef.black202020,
                        offset: const Offset(0, 0),
                        position: PopupMenuPosition.over,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        itemBuilder: (BuildContext context) {
                          return provider.fontFamilies.map((String fontFamily) {
                            final bool isSelected = stackBoardItem.fontFamily == fontFamily;
                            return PopupMenuItem(
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
                                      onChanged: (bool? newValue) {
                                        if (newValue != null && newValue) {
                                          setState(() {
                                            provider.setSelectedFontFamily(fontFamily);
                                            stackBoardItem.fontFamily = fontFamily;
                                            provider.onBack();
                                          });
                                        }
                                      },
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
                            stackBoardItem.fontFamily = selectedFontFamily;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 9),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ColorRef.white,
                          ),
                          child: Center(
                            child: Text(
                              stackBoardItem.fontFamily ?? "Fonts",
                              style: const TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: provider.letters.map((e) {
                          int index = provider.letters.indexOf(e);
                          return GestureDetector(
                            onTap: () => setState(() => provider.toggleTextStyle(index, stackBoardItem)),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: e['apply'] ? ColorRef.yellowFFA500 : ColorRef.white,
                              ),
                              child: SvgPicture.asset(e['type'], height: 15, width: 15),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 92, child: VerticalDivider(color: ColorRef.greyD9D9D9, thickness: 1)),
                Expanded(
                  child: Column(
                    children: [
                      PopupMenuButton(
                        shadowColor: ColorRef.black202020,
                        color: ColorRef.whiteFFFFFF,
                        surfaceTintColor: ColorRef.whiteFFFFFF,
                        offset: const Offset(-1, -1),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(maxWidth: 120, minWidth: 120, minHeight: 180, maxHeight: 180),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        itemBuilder: (BuildContext context) {
                          return provider.fontSize.map((double fontFontSize) {
                            final bool isSelected = stackBoardItem.fontSize == fontFontSize;
                            return PopupMenuItem(
                              value: fontFontSize,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSelected ? ColorRef.blueEFF6FF : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: isSelected,
                                      onChanged: (bool? newValue) {
                                        if (newValue != null && newValue) {
                                          setState(() {
                                            provider.setSelectedFontSize(fontFontSize);
                                            stackBoardItem.fontSize = fontFontSize;
                                            provider.onBack();
                                          });
                                        }
                                      },
                                      activeColor: ColorRef.blue1E75E5,
                                    ),
                                    Text(
                                      fontFontSize.toString(),
                                      style: TextStyle(
                                        color: ColorRef.grey406110A,
                                        fontSize: 15,
                                        fontFamily: 'Lato',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList();
                        },
                        onSelected: (double selectedFontSize) {
                          setState(() {
                            provider.setSelectedFontSize(selectedFontSize);
                            stackBoardItem.fontSize = selectedFontSize;
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
                                (stackBoardItem.fontSize??22).toString(),
                                style: const TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w400),
                              ),
                              const Icon(Icons.keyboard_arrow_down_outlined)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: provider.cases.map((e) {
                          int index = provider.cases.indexOf(e);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                provider.toggleTextCase(provider.cases[index], index, stackBoardItem);
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5), color: provider.selectedCaseIndex == index.toString() ? ColorRef.yellowFFA500 : ColorRef.white),
                              child: Text(provider.cases[index], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Lato')),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor: BoolRef.themeChange ? ColorRef.blue1E2A38 : ColorRef.whiteFFFFFF,
                            surfaceTintColor: BoolRef.themeChange ? ColorRef.blue1E2A38 : ColorRef.whiteFFFFFF,
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ColorPicker(
                                  pickerColor: provider.selectedColor,
                                  pickerAreaBorderRadius: BorderRadius.circular(10.0),
                                  onColorChanged: (Color color) {
                                    setState(() {
                                      provider.selectedColor = color;
                                      provider.onColorChange(color, stackBoardItem);
                                      stackBoardItem.color =color;
                                    });
                                  },
                                  colorPickerWidth: 232.0,
                                  pickerAreaHeightPercent: 0.7,
                                  displayThumbColor: false,
                                  enableAlpha: false,
                                  showLabel: false,
                                ),
                                Container(
                                  height: 35,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: ColorRef.yellowFFA500,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextButton(
                                    child: Text('Apply', style: TextStyle(fontFamily: 'Lato', fontSize: 15, fontWeight: FontWeight.w400, color: ColorRef.black202020)),
                                    onPressed: () => NavigationService.goBack(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: ColorRef.whiteFFFFFF,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      SvgPath.color_selection,
                      height: 25,
                      width: 25,
                    ),
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
                            provider.onColorOpacityChange(opacity, stackBoardItem);
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: stackBoardItem.color?.withOpacity(opacity)??ColorRef.black202020.withOpacity(opacity), // Apply opacity to the selected color
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
      ),
    );
  }
}
