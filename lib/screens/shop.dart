import 'package:CareAlliances/widget/webview_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        elevation: 0,
        // iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Shop",
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
          url: 'https://thecarealliances.com/category.php'),
    );
  }
}
