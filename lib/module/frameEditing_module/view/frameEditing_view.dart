import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../utils/bool.dart';
import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../provider/frameEditing_provider.dart';

class FrameEditorView extends StatelessWidget {
  FrameEditorView({
    Key? key,
    this.imageList,
    this.label,
  }) : super(key: key);

  List<String>? imageList;
  String? label;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => FrameEditorProvider(),
      builder: (context, child) {
        FrameEditorProvider provider = context.watch<FrameEditorProvider>();
        return SafeArea(
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
                  color: BoolRef.themeChange
                      ? ColorRef.white
                      : ColorRef.black202020,
                ),
              ),
              centerTitle: true,
              title: Text(
                label ?? '',
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    provider.onNext(
                      context,
                      label ?? '',
                      provider.selectedImage != null
                          ? provider.selectedImage!
                          : imageList![0],
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Text(
                      StrRef.next,
                      style: TextStyle(
                        color: ColorRef.blue0250A4,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      provider.selectedImage != null
                          ? provider.selectedImage!
                          : imageList![0],
                      height: 350,
                      width: 370,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          provider.toggleSelection(true);
                        },
                        child: Container(
                          height: 25,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: provider.isImageSelected
                                ? ColorRef.yellowFFA500
                                : ColorRef.greyEDEDED,
                          ),
                          child: const Center(
                            child: Text("Image"),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          provider.toggleSelection(false);
                        },
                        child: Container(
                          height: 25,
                          width: 80,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: provider.isVideoSelected
                                ? ColorRef.yellowFFA500
                                : ColorRef.greyEDEDED,
                          ),
                          child: const Center(
                            child: Text("Videos"),
                          ),
                        ),
                      ),
                      const Spacer(),
                      PopupMenuButton<String>(
                        color: ColorRef.white,
                        position: PopupMenuPosition.under,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        itemBuilder: (BuildContext context) {
                          return provider.languages.map((String language) {
                            return PopupMenuItem<String>(
                              height: 40,
                              value: language,
                              child: Text(
                                language,
                                style: TextStyle(
                                  color: language == 'All Languages'
                                      ? Colors.blue
                                      : null,
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                ),
                              ),
                            );
                          }).toList();
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            SvgPath.translation,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          provider.onInfo(context, label ?? '');
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset(SvgPath.information),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (provider.isImageSelected)
                    SizedBox(
                      height: 250,
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        children: imageList!.map((image) {
                          return GestureDetector(
                            onTap: () {
                              provider.setSelectedImage(image);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(image),
                            ),
                          );
                        }).toList(),
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
