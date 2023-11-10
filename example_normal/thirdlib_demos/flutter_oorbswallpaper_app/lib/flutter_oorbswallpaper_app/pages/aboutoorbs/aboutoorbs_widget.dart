import 'package:flutter/material.dart';
import 'package:flutter_oorbswallpaper_app/flutter_oorbswallpaper_app.dart';
import '../ayarlar/ayarlar_widget.dart';

class AboutoorbsWidget extends StatefulWidget {
  const AboutoorbsWidget({Key? key}) : super(key: key);

  @override
  _AboutoorbsWidgetState createState() => _AboutoorbsWidgetState();
}

class _AboutoorbsWidgetState extends State<AboutoorbsWidget> {
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
            fit: BoxFit.cover,
            image: Image.asset(
              Utils.assets('images/privacy.jpg'),
            ).image,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 75,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.asset(
                    Utils.assets('images/png.png'),
                  ).image,
                ),
              ),
            ),
            FlutterFlowWebView(
              url: 'https://oorbs.studio',
              bypass: false,
              height: MediaQuery.of(context).size.height * 0.65,
              verticalScroll: false,
              horizontalScroll: false,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 75,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.asset(
                    Utils.assets('images/png2.png'),
                  ).image,
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AyarlarWidget(),
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chevron_left_sharp,
                    color: FlutterFlowTheme.of(context).grayLight,
                    size: 28,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context)!.getText(
                        'z6hhnz10' /* Back to Settings */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).grayLight,
                            fontSize: 16,
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
