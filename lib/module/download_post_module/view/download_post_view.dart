import 'package:festo_post/app_export.dart';
import 'package:flutter/cupertino.dart';

class DownloadPostView extends StatelessWidget {
  final Uint8List? imageData;

  const DownloadPostView({super.key, this.imageData});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (BuildContext context) => DownloadPostProvider(),
      builder: (context, child) {
        DownloadPostProvider provider = context.watch<DownloadPostProvider>();
        return Theme(
          data: BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () => NavigationService.goBack(),
                  icon: Icon(Icons.arrow_back_ios_new_rounded,
                      size: 24, color: ColorRef.textPrimaryColor),
                ),
                centerTitle: true,
                title: Text(StrRef.downloadShare,
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400)),
              ),
              resizeToAvoidBottomInset: false,
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: SizedBox(
                        width: 350,
                        height: 350,
                        child: Image.memory(imageData!,
                            height: 350, width: 350, fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () => provider.onDownload(imageData!),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        color: ColorRef.yellowFFA500,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            StrRef.download,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                                color: ColorRef.black202020),
                          ),
                          Lottie.asset(SvgPath.download),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                      // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          border: Border.all(
                            color: BoolRef.themeChange
                                ? ColorRef.transparent
                                : ColorRef.greyBCBCBC,
                            width: 1.5,
                          ),
                          color: BoolRef.themeChange
                              ? ColorRef.blue304359
                              : ColorRef.whiteFFFFFF),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            StrRef.sharePost,
                            style: TextStyle(
                                color: ColorRef.textPrimaryColor,
                                fontFamily: 'Lato',
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 100,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              itemCount: provider.shareLogo.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorRef.greyB0B0B0
                                                .withOpacity(0.7),
                                            spreadRadius: 1,
                                            blurRadius: 7,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                        color: ColorRef.whiteFFFFFF,
                                      ),
                                      child: SvgPicture.asset(
                                        provider.shareLogo[index]["logo"],
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                  ),
                                ]);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(width: 5),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Schedule Post

// const Spacer(),
// Container(
//   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
//   height: 277,
//   decoration: BoxDecoration(
//     borderRadius: const BorderRadius.only(
//       topLeft: Radius.circular(20.0),
//       topRight: Radius.circular(20.0),
//     ),
//     border: Border.all(
//       color: ColorRef.greyBCBCBC,
//       width: 1.5,
//     ),
//   ),
//   child: Column(
//     children: [
//       Row(
//         children: [
//           SvgPicture.asset(SvgPath.schedule, height: 20, width: 20),
//           const SizedBox(width: 10),
//           Text(
//             StrRef.schedule,
//             style: const TextStyle(fontSize: 16, fontFamily: "lato", fontWeight: FontWeight.w400),
//           ),
//           const Spacer(),
//           SvgPicture.asset(SvgPath.downArrow, height: 20, width: 20),
//         ],
//       ),
//       const SizedBox(height: 5),
//       Divider(thickness: 1, color: ColorRef.greyBCBCBC),
//       const SizedBox(height: 10),
//       Row(
//         children: [
//           Text(
//             StrRef.shareFacebook,
//             style: const TextStyle(fontSize: 15, fontFamily: "lato", fontWeight: FontWeight.w400),
//           ),
//           const Spacer(),
//           Container(
//             width: 40.0,
//             height: 20,
//             padding: const EdgeInsets.symmetric(horizontal: 3),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15.0),
//               color: ColorRef.greyE0E0E0,
//             ),
//             child: AnimatedAlign(
//               alignment: Alignment.centerRight,
//               duration: const Duration(milliseconds: 200),
//               curve: Curves.easeInOut,
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 200),
//                 width: 14.0,
//                 height: 14.0,
//                 decoration: BoxDecoration(shape: BoxShape.circle, color: ColorRef.greyAFAFAF),
//               ),
//             ),
//           ),
//         ],
//       ),
//       const SizedBox(height: 10),
//       Row(
//         children: [
//           Text(
//             StrRef.shareInstagram,
//             style: const TextStyle(fontSize: 15, fontFamily: "lato", fontWeight: FontWeight.w400),
//           ),
//           const Spacer(),
//           Container(
//             width: 40.0,
//             height: 20,
//             padding: const EdgeInsets.symmetric(horizontal: 3),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15.0),
//               color: ColorRef.greyE0E0E0,
//             ),
//             child: AnimatedAlign(
//               alignment: Alignment.centerRight,
//               duration: const Duration(milliseconds: 200),
//               curve: Curves.easeInOut,
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 200),
//                 width: 14.0,
//                 height: 14.0,
//                 decoration: BoxDecoration(shape: BoxShape.circle, color: ColorRef.greyAFAFAF),
//               ),
//             ),
//           ),
//         ],
//       ),
//       const SizedBox(height: 15),
//       Divider(thickness: 1, color: ColorRef.greyBCBCBC,indent: 0,endIndent: 0,),
//       const SizedBox(height: 10),
//       Align(
//         alignment: Alignment.centerLeft,
//         child: Text(
//           StrRef.sharePost,
//           textAlign: TextAlign.left,
//           style: const TextStyle(fontSize: 16, fontFamily: "lato", fontWeight: FontWeight.w400),
//         ),
//       ),
//       const SizedBox(height: 10),
//     ],
//   ),
// )
