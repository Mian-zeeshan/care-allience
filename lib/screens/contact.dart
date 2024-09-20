import 'package:CareAlliances/widget/custom_drawer.dart';
import 'package:CareAlliances/widget/webview_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        elevation: 0,
        // iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Contact us",
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
          url: 'https://thecarealliances.com/contact-us.php'),
    );
  }
}
