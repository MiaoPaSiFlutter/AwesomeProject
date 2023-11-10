import 'package:flutter/material.dart';
import 'package:flutter_oorbswallpaper_app/flutter_oorbswallpaper_app.dart';

import 'body.dart';
import 'widgets/appbar.dart';

class AboveWidget extends StatefulWidget {
  const AboveWidget({Key? key}) : super(key: key);

  @override
  _AboveWidgetState createState() => _AboveWidgetState();
}

class _AboveWidgetState extends State<AboveWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: createAppBar(context),
      backgroundColor: const Color(0xFF111417),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: const Color(0xFF14181B),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Image.asset(Utils.assets('images/privacy.jpg')).image,
          ),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Body(),
              const FlutterFlowAdBanner(
                width: 320,
                height: 100,
                showsTestAd: false,
                iOSAdUnitID: 'ca-app-pub-5455528914159263/6673061197',
                androidAdUnitID: 'ca-app-pub-5455528914159263/4322445623',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
