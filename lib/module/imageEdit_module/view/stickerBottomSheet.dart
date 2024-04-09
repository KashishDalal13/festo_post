import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:festo_post/app_export.dart';
import 'dart:io';

class StickerBottomSheet extends StatefulWidget {
  final ImageEditProvider? provider;

  const StickerBottomSheet({Key? key, this.provider}) : super(key: key);

  @override
  _StickerBottomSheetState createState() => _StickerBottomSheetState();
}
//payal
class _StickerBottomSheetState extends State<StickerBottomSheet> {
  late String _localImagePath;

  @override
  void initState() {
    super.initState();
    _localImagePath = '';
    _checkIfImageDownloaded();
  }

  // Function to check if the image is already downloaded
  Future<void> _checkIfImageDownloaded() async {
    // Check if the image is already downloaded
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    final String fileName = 'image.png'; // Update filename if needed
    final File imageFile = File('$appDocPath/$fileName');
    if (await imageFile.exists()) {
      // Image is already downloaded, set the local image path
      setState(() {
        _localImagePath = imageFile.path;
      });
    }
  }

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
                      downloadAndSaveImage(provider.stickerList[index]['imageUrl']);
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
                      // Display the downloaded image if available
                      _localImagePath.isNotEmpty
                          ? Image.file(File(_localImagePath))
                          : const SizedBox(), // Show nothing if image path is empty
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

  // Function to download and save the image
  Future<void> downloadAndSaveImage(String imageUrl) async {
    try {
      if (_localImagePath.isNotEmpty) {
        // Image is already downloaded, do nothing
        return;
      }

      // Get the local storage directory
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String appDocPath = appDocDir.path;

      // Download and cache the image using flutter_cache_manager
      final DefaultCacheManager cacheManager = DefaultCacheManager();
      final File file = await cacheManager.getSingleFile(imageUrl);

      // Copy the cached image file to the local storage directory
      final String fileName = 'image.png'; // Change the filename as needed
      final String localFilePath = '$appDocPath/$fileName';
      final File localFile = await file.copy(localFilePath);

      print('Image downloaded and saved to: $localFilePath');

      // Set the local image path and update the UI
      setState(() {
        _localImagePath = localFile.path;
      });
    } catch (e) {
      print('Error downloading and saving image: $e');
    }
  }
}
