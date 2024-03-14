import 'package:festo_post/module/imageEdit_module/provider/imageEdit_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../utils/bool.dart';
import '../../../utils/colors.dart';
import '../../../utils/string.dart';

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
          bottom: true,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorRef.white,
              surfaceTintColor: ColorRef.white,
              leading: IconButton(
                onPressed: () {
                  provider.onBack();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 24,
                  color: BoolRef.themeChange ? ColorRef.white : ColorRef.black202020,
                ),
              ),
              centerTitle: true,
              title: Text(label ?? '', style: const TextStyle(fontSize: 20, fontFamily: 'Lato', fontWeight: FontWeight.w400)),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.check, size: 24, color: ColorRef.blue0250A4),
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
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            selectedImage ?? "",
                            height: 350,
                            width: 370,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ...provider.frameDetails.map(
                          (e) {
                            int index = provider.frameDetails.indexOf(e);
                            if (e["show"] == true) {
                              return Positioned(
                                top: e['position'].dy * 350, // Convert int to double
                                left: e['position'].dx * 370, // Convert int to double
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
                    height: 150,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
