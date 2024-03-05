import 'package:festo_post/module/login_module/provider/register_provider.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/string.dart';

class AddDetails extends StatelessWidget {
  final RegisterProvider provider;

  const AddDetails({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: () => provider.onBack(), icon: const Icon(Icons.arrow_back_ios_rounded, size: 20)),
          centerTitle: true,
          title: Text(StrRef.addDetails)),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [Text("Add details")],
      ),
    );
  }
}
