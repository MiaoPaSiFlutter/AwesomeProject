// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_oorbswallpaper_app/flutter_oorbswallpaper_app.dart';

class IndirildiWidget extends StatefulWidget {
  const IndirildiWidget({Key? key}) : super(key: key);

  @override
  _IndirildiWidgetState createState() => _IndirildiWidgetState();
}

class _IndirildiWidgetState extends State<IndirildiWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFF14181B),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Image.asset(
              Utils.assets('images/background.jpg'),
            ).image,
          ),
          shape: BoxShape.rectangle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Utils.assets('images/complete.png'),
              width: 275,
              height: 275,
              fit: BoxFit.fitHeight,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 6, 0, 24),
                  child: Text(
                    FFLocalizations.of(context)!.getText(
                      'kxj53icn' /* Great! */,
                    ),
                    style: FlutterFlowTheme.of(context).title1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(32, 12, 32, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context)!.getText(
                            'un1erl02' /* Your wallpaper has been downlo... */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Montserrat',
                                    color: const Color(0xB3FFFFFF),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Lottie.asset(
                  Utils.assets('lottie_animations/106430-arrow-red.json'),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  animate: true,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                  child: FFButtonWidget(
                    onPressed: () async {
                      HapticFeedback.heavyImpact();
                      Navigator.pop(context);
                    },
                    text: FFLocalizations.of(context)!.getText(
                      'wkg770d2' /* Okay */,
                    ),
                    options: FFButtonOptions(
                      width: 130,
                      height: 50,
                      color: const Color(0xC0C03A52),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                              ),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(32, 12, 32, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                      child: Text(
                        FFLocalizations.of(context)!.getText(
                          'zb9pjrks' /* We always provide you the high... */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Montserrat',
                              color: const Color(0xB3FFFFFF),
                              fontSize: 11,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
