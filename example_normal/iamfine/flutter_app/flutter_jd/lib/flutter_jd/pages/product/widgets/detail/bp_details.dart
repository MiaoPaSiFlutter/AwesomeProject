import 'package:flutter/material.dart';
import 'mpsf_webview.dart';

class BpBpDetails extends StatefulWidget {
  const BpBpDetails({Key? key}) : super(key: key);

  @override
  State createState() => _BpBpDetailsState();
}

class _BpBpDetailsState extends State<BpBpDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MpsfWebView(url: 'https://flutter.cn/');
  }
}
