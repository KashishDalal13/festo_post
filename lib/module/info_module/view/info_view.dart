import 'package:festo_post/module/info_module/provider/info_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/bool.dart';
import '../../../utils/colors.dart';
import '../../../utils/string.dart';

class InfoView extends StatelessWidget {
  final String label;
  const InfoView({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (BuildContext context) => InfoProvider(),
      builder: (context, child) {
        InfoProvider provider = context.watch<InfoProvider>();
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Stack(
                  alignment: Alignment(0,1.05),
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
                            color: ColorRef.yellowFFA500,
                          ),
                          alignment: Alignment.center,
                          child: Image.asset(
                            SvgPath.info,                      ),
                        ),
                        IconButton(
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

                      ],
                    ),
                    Container(color:ColorRef.blue1E2A38,child: Text("Button")),
                  ],
                ),
               /* Expanded(
                  flex: 1,
                  child: Container(color: ColorRef.blue0250A4,
                    child: Stack(
                      children: [
                        Image.asset(
                          SvgPath.info,
                        ),
                        Positioned(
                          top: 16,
                          left: 10,
                          child: IconButton(
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
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(color: ColorRef.yellowFFEDCC,
                    child: Stack(
                      children: [
                        Image.asset(
                          SvgPath.info,
                        ),
                        Positioned(
                          top: 16,
                          left: 10,
                          child: IconButton(
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
                        ),
                      ],
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        );
      },
    );
  }
}
