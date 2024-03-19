import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../provider/profile_provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileProvider(),
      builder: (context, child) {
        ProfileProvider provider = context.watch<ProfileProvider>();
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => provider.onBack(),
              icon: const Icon(Icons.arrow_back_ios_rounded, size: 20),
            ),
            centerTitle: true,
            title: Text(
              StrRef.myAccount,
              style: const TextStyle(
                fontFamily: 'Lato',
                fontSize: 20,
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: ColorRef.greyD6D6D6),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      padding: const EdgeInsets.all(10.0),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: ColorRef.greyD6D6D6),
                      ),
                      child: Image.asset(SvgPath.logo),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StrRef.loopbots,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, fontFamily: "Lato"),
                          ),
                          Text(StrRef.phnNo, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: "Lato", color: ColorRef.blue0250A4)),
                        ],
                      ),
                    )
                    // Add your widgets here
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: provider.profileDetails.length, // Specify the number of items
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: ColorRef.greyD6D6D6),
                      ),
                      child: ListTile(
                        leading: SvgPicture.asset(provider.profileDetails[index]['icon']),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20,
                        ),
                        title: Text(provider.profileDetails[index]['label']), // Generate dynamic titles
                        onTap: () {
                          // debugPrint("hii");
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
