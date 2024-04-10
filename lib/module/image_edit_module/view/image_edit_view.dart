import 'package:festo_post/app_export.dart';

class ImageEditView extends StatelessWidget {
  const ImageEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List argument = ModalRoute.of(context)!.settings.arguments as List;
    return ChangeNotifierProvider(
      create: (BuildContext context) => ImageEditProvider(),
      builder: (context, child) {
        ImageEditProvider provider = context.watch<ImageEditProvider>();
        return Theme(
          data: BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () => provider.onBack(),
                  icon: Icon(Icons.arrow_back_ios_new_rounded, size: 24, color: ColorRef.textPrimaryColor),
                ),
                centerTitle: true,
                title: Text(argument[0], style: const TextStyle(fontSize: 20, fontFamily: 'Lato', fontWeight: FontWeight.w400)),
                actions: [
                  TextButton(
                    onPressed: () async => provider.captureEditedImage(),
                    child: Icon(Icons.check, size: 24, color: BoolRef.themeChange ? ColorRef.blue3498DB : ColorRef.blue0250A4),
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
                      child: RepaintBoundary(
                        key: provider.repaintBoundaryKey,
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
                                    return ItemCase(
                                      key: Key('StackBoardItem${t.id}'),
                                      isCenter: false,
                                      onDel: () async => provider.boardController.remove(t.id),
                                      onTap: () => provider.boardController.moveItemToTop(t.id),
                                      caseStyle: const CaseStyle(borderColor: Colors.grey, iconColor: Colors.white),
                                      child: GestureDetector(
                                        onTap: () {
                                          debugPrint(t.id.toString());
                                          provider.currentItemId = t.id.toString();
                                          for (var element in provider.letters) {
                                            if (t.fontStyle == FontStyle.italic) {
                                              element['apply'] = true;
                                            } else {
                                              element['apply'] = false;
                                            }
                                            if (t.fontWeight == FontWeight.bold) {
                                              element['apply'] = true;
                                            } else {
                                              element['apply'] = false;
                                            }
                                            if (t.decoration == TextDecoration.underline) {
                                              element['apply'] = true;
                                            } else {
                                              element['apply'] = false;
                                            }
                                          }
                                          showModalBottomSheet(
                                            context: context,
                                            backgroundColor: ColorRef.transparent,
                                            builder: (BuildContext context) {
                                              return StatefulBuilder(
                                                builder: (context, setState) {
                                                  return EditingBottomSheet(
                                                    provider: provider,
                                                    item: t,
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
                                            t.styleCase == 'AA'
                                                ? (t.customText ?? '').toUpperCase()
                                                : t.styleCase == 'aa'
                                                    ? t.customText!.toLowerCase()
                                                    : "${t.customText!.substring(0, 1).toUpperCase()}${t.customText!.substring(1).toLowerCase()}",
                                            style: TextStyle(
                                                fontFamily: t.fontFamily,
                                                fontSize: t.fontSize,
                                                color: t.color,
                                                fontStyle: t.fontStyle,
                                                fontWeight: t.fontWeight,
                                                decoration: t.decoration),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return null;
                                },
                                background: Stack(
                                  children: [
                                    Image.asset(argument[1], height: 350, width: 370, fit: BoxFit.cover),
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
                                    left: e['left'].toDouble(),
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
                    ),
                    SizedBox(
                      height: 110,
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
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: ColorRef.backgroundColor,
                                    border: Border.all(
                                      color: provider.frameDetails[index]['show'] ? ColorRef.blue3498DB : ColorRef.transparent,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: SvgPicture.asset(
                                      provider.frameDetails[index]['imageList'],
                                      height: 20,
                                      width: 20,
                                      colorFilter: ColorFilter.mode(
                                        provider.frameDetails[index]['show']
                                            ? ColorRef.blue3498DB
                                            : BoolRef.themeChange
                                                ? ColorRef.whiteFFFFFF
                                                : ColorRef.grey757575,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 5),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: Container(
                        width: 370,
                        height: 81,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorRef.backgroundColor),
                        child: Center(
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: provider.editDetails.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () => provider.edit(index: index, context: context, provider: provider),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: BoolRef.themeChange ? ColorRef.grey304359 : ColorRef.white),
                                      child: SvgPicture.asset(provider.editDetails[index]['image']),
                                    ),
                                    Text(provider.editDetails[index]['label'] ?? '',
                                        style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato', fontSize: 12, color: ColorRef.textPrimaryColor))
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
