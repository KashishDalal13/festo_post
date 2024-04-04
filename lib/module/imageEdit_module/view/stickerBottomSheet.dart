import 'package:festo_post/app_export.dart';

class StickerBottomSheet extends StatefulWidget {
  final ImageEditProvider? provider;

  const StickerBottomSheet({Key? key, this.provider}) : super(key: key);

  @override
  _StickerBottomSheetState createState() => _StickerBottomSheetState();
}

class _StickerBottomSheetState extends State<StickerBottomSheet> {
  @override
  Widget build(BuildContext context) {
    ImageEditProvider? provider = widget.provider!;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 420,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        color: BoolRef.themeChange ? ColorRef.blue304359 : ColorRef.greyEDEDED,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
              width: screenWidth,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: provider.stickerList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        provider.onSelectSticker(index: index);
                      });
                    },
                    child: Container(
                      height: 30,
                      width: screenWidth * 0.2, // Adjust width based on screen size
                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index == provider.stickerIndex ? ColorRef.yellowFFA500 : ColorRef.white,
                      ),
                      child: Center(
                        child: Text(
                          provider.stickerList[index]['label'],
                          style: const TextStyle(fontSize: 15, fontFamily: 'Lato', fontWeight: FontWeight.w400),
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
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  color: BoolRef.themeChange ? ColorRef.blue304359 : ColorRef.greyEDEDED,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IndexedStack(
                    index: provider.stickerViewIndex,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StrRef.downloadText,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, fontFamily: 'Lato', fontWeight: FontWeight.w400, color: ColorRef.textPrimaryColor),
                          ),
                          const SizedBox(height: 25),
                          GestureDetector(
                            onTap: () {
                              setState(() => provider.onChangeStickerView());
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              height: 50,
                              width: screenWidth * 0.4, // Adjust width based on screen size
                              decoration: BoxDecoration(
                                color: ColorRef.yellowFFA500,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    StrRef.download,
                                    style: TextStyle(fontSize: 15, fontFamily: 'Lato', fontWeight: FontWeight.bold, color: ColorRef.black202020),
                                  ),
                                  Lottie.asset(SvgPath.download),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemCount: provider.stickerList[provider.stickerIndex]['imageList'].length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              provider.boardController.add(
                                StackBoardItem(
                                  caseStyle: const CaseStyle(boxAspectRatio: 350 / 370),
                                  child: Image.asset(provider.stickerList[provider.stickerIndex]['imageList'][index]),
                                ),
                              );
                            },
                            child: Image.asset(provider.stickerList[provider.stickerIndex]['imageList'][index]),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
