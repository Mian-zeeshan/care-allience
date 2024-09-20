import 'package:CareAlliances/widget/webview_container.dart';
import 'package:flutter/material.dart';

import '../widget/custom_drawer.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key, required this.title, required this.webUrl});

  final String title;
  final String webUrl;

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WebViewContainer(
        url: widget.webUrl,
      ),
    );
  }
}
