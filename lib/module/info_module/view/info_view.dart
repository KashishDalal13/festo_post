import 'package:festo_post/module/info_module/provider/info_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/bool.dart';
import '../../../utils/colors.dart';
import '../../../utils/string.dart';

class InfoView extends StatelessWidget {
  final String? label;

  const InfoView({
    Key? key,
    this.label,
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: const Alignment(0, 1.15),
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0)),
                              color: ColorRef.yellowFFA500,
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(
                              SvgPath.info,
                            ),
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
                      Container(
                        height: 50,
                        width: 280,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ColorRef.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Text(
                          label ?? "",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ColorRef.blue0250A4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    child: Column(
                      children: [
                        Text(
                          StrRef.info,
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                endIndent: 10,
                                color: ColorRef.grey717171,
                              ),
                            ),
                            Text(
                              StrRef.tag,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  color: ColorRef.blue0250A4),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Divider(
                                thickness: 0.5, // Adjust thickness as needed
                                color: ColorRef
                                    .grey717171, // Adjust color as needed
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Stack(
                          alignment: const Alignment(0.85, 1.70),
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorRef.greyEDEDED, width: 2),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  StrRef.hashtag,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Lato',
                                      fontSize: 14,
                                      color: ColorRef.black505050),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                provider.copyToClipboard(StrRef.hashtag);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  // shape: BoxShape.circle,
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: ColorRef.yellowFFA500,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Icon(
                                    Icons.copy_outlined,
                                    size: 20,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
