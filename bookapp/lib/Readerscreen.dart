import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReaderScreen extends StatefulWidget {

final int chapterID;
ReaderScreen(this.chapterID);
  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}
WebViewController _controller;
class _ReaderScreenState extends State<ReaderScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter'+widget.chapterID.toString()),
      ),
      body: WebView(
        initialUrl: 'about:blank',
        onWebViewCreated: (WebViewController webviewcontroller){
          _controller = webviewcontroller;
          _loadHtmlCh1();
        },
      ),
      
    );
  }
}
//asynchronous
_loadHtmlCh1() async{
  String fileText = await rootBundle.loadString("assets/ch1.html");
  _controller.loadUrl(Uri.dataFromString(
    fileText,mimeType: 'text.html',
  encoding: Encoding.getByName('utf-8')).toString());
}

_loadHtmlCh2() async{
  String fileText = await rootBundle.loadString("assets/ch2.html");
  _controller.loadUrl(Uri.dataFromString(
    fileText,mimeType: 'text.html',
  encoding: Encoding.getByName('utf-8')).toString());
}
