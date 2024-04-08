import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class News_URL extends StatefulWidget {
  String url;
   News_URL({super.key,required this.url});

  @override
  State<News_URL> createState() => _News_URLState();
}

class _News_URLState extends State<News_URL> {
  late WebViewController controller;
  @override
  void initState(){
    controller = WebViewController()..loadRequest(Uri.parse(widget.url));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: WebViewWidget(controller: controller),
   );
  }
}
