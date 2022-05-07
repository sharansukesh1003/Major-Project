// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

ConstantColors constantColors = ConstantColors();

class ContainedView extends StatefulWidget {

  final String url;
  const ContainedView({required this.url});

  @override
  State<ContainedView> createState() => _ContainedViewState();
}

class _ContainedViewState extends State<ContainedView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.primaryColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.primaryColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
          Text("N",
            style: TextStyle(
              color: ConstantColors.secondaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
            ),
            Text("ews",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
            ),
          ],
        ),
      ),
      body: WebView(
        initialUrl: widget.url,
        onWebViewCreated: ((WebViewController webViewController) {
          _controller.complete(webViewController);
        }),
      ),
    );
  }
}