
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
                  style:  TextStyle(fontFamily: 'Lato', fontSize: 20,color: ColorRef.textPrimaryColor)),
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
                        : ColorRef.greyCACACA,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(SvgPath.audio, height: 20, width: 20,color:ColorRef.textPrimaryColor,),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(StrRef.selectAudioText,style: TextStyle(color: ColorRef.textPrimaryColor,fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'Lato'),),
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
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              provider.onSelectTrending(index: index);
                            },
                            child: Container(
                              height: 30,
                              width: 120,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: index == provider.audioIndex
                                    ? ColorRef.yellowFFA500
                                    : ColorRef.greyCACACA,
                              ),
                              child: Center(
                                child: Text(
                                  provider.audioList[index]['label'],style: const TextStyle(fontFamily: 'Lato',fontWeight:FontWeight.w600,fontSize: 15),
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
                const SizedBox(height: 10),
                Expanded(
                  // width: 20,
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: provider
                          .audioList[provider.audioIndex]['audios'].length,
                      itemBuilder: (context, index) {
                        // String audioPath = provider.audioList[provider.audioIndex]['audios'][index]['audio'];

                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: BoolRef.themeChange
                                ? ColorRef.blue304359
                                : ColorRef.greyCACACA,
                          ),
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () async {
                                    String audioPath = provider.audioList[provider.audioIndex]
                                    ['audios'][index]['audio'];
                                    debugPrint("audio $audioPath");
                                    await provider.audioPlayer.setAsset(audioPath);
                                    provider.togglePlayback(index);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 5),
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: ColorRef.whiteFFFFFF,
                                    ),
                                    child: SvgPicture.asset(provider.isPlaying ? SvgPath.pause : SvgPath.play,height: 10,width: 10,)
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(provider.audioList[provider.audioIndex]
                                  ['audios'][index]['audio'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,fontFamily: 'Lato',color: ColorRef.textPrimaryColor),),
                              const Spacer(),
                              Text(provider.audioList[provider.audioIndex]
                              ['audios'][index]['duration'],style: TextStyle(fontFamily: 'Lato',fontWeight: FontWeight.w400,fontSize: 12,color: ColorRef.textPrimaryColor),),
                            ],
                          ),
                        );
                        // Image.asset(provider.audioList[provider.audioIndex]['audio'][index]);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
