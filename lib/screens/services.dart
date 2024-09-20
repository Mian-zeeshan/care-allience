import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/webview_container.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.white,
          elevation: 0,
          // iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "Services",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: const WebViewContainer(
            url: 'https://thecarealliances.com/services.php'));
  }
}
