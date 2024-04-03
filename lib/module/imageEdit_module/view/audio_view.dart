import 'package:flutter/cupertino.dart';

import '../../../app_export.dart';

class AudioView extends StatelessWidget {
  const AudioView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (BuildContext context) => ImageEditProvider(),
      builder: (context, child) {
        ImageEditProvider provider = context.watch<ImageEditProvider>();
        return Theme(
          data: BoolRef.themeChange ? ThemeRef.darkTheme : ThemeRef.lightTheme,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => provider.onBack(),
                icon: Icon(Icons.arrow_back_ios_rounded,
                    size: 20, color: ColorRef.textPrimaryColor),
              ),
              centerTitle: true,
              title: Text(StrRef.selectAudio,
                  style: const TextStyle(fontFamily: 'Lato', fontSize: 20)),
            ),
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: BoolRef.themeChange
                        ? ColorRef.blue304359
                        : ColorRef.greyEDEDED,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(SvgPath.audio, height: 20, width: 20),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(StrRef.selectAudioText),
                        const Spacer(),
                        Icon(Icons.arrow_forward_ios_rounded,
                            size: 20, color: ColorRef.textPrimaryColor)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: provider.audioList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Color unselectedColor = BoolRef.themeChange
                          ? ColorRef.greyF9F9F9
                          : ColorRef.yellowFFEDCC;
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              provider.onSelectTrending(index: index);
                            },
                            child: Container(
                              height: 30,
                              width: 100,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: index == provider.audioIndex
                                    ? ColorRef.yellowFFA500
                                    : unselectedColor,
                              ),
                              child: Center(
                                child: Text(
                                  provider.audioList[index]['label'],
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(height: 15),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 5);
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(
                  // width: 20,
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: provider
                          .audioList[provider.audioIndex]['audios'].length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: BoolRef.themeChange
                                ? ColorRef.blue304359
                                : ColorRef.greyEDEDED,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                    provider.audioList[provider.audioIndex]
                                        ['audios'][index]['image'],
                                    height: 20,
                                    width: 20),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(provider.audioList[provider.audioIndex]
                                    ['audios'][index]['audio']),
                                const Spacer(),
                                Text(provider.audioList[provider.audioIndex]
                                ['audios'][index]['duration']),
                              ],
                            ),
                          ),
                        );
                        // Image.asset(provider.audioList[provider.audioIndex]['audio'][index]);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 15)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
