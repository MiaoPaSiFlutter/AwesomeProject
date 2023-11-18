// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_oorbswallpaper_app/flutter_oorbswallpaper_app.dart';

class MailscreenWidget extends StatefulWidget {
  const MailscreenWidget({Key? key}) : super(key: key);

  @override
  _MailscreenWidgetState createState() => _MailscreenWidgetState();
}

class _MailscreenWidgetState extends State<MailscreenWidget> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 55, 0, 0),
                  child: Icon(
                    Icons.mark_email_read_outlined,
                    color: Color(0xC0C03A52),
                    size: 150,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                  child: Text(
                    FFLocalizations.of(context)!.getText(
                      '7dt1tjd6' /* Great! */,
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
                            'dypbuf6p' /* Thank you for sending us an e-... */,
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 66),
                  child: FFButtonWidget(
                    onPressed: () async {
                      HapticFeedback.heavyImpact();
                      Navigator.pop(context);
                    },
                    text: FFLocalizations.of(context)!.getText(
                      'czykdu3w' /* Okay */,
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
          ],
        ),
      ),
    );
  }
}
