// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_oorbswallpaper_app/flutter_oorbswallpaper_app.dart';
import '../collections/collections_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../ayarlar/ayarlar_widget.dart';
import '../kilavuz/kilavuz_widget.dart';
import '../circadiandailywallp/circadiandailywallp_widget.dart';
import 'animationsMap.dart';

class GirisWidget extends StatefulWidget {
  const GirisWidget({Key? key}) : super(key: key);

  @override
  _GirisWidgetState createState() => _GirisWidgetState();
}

class _GirisWidgetState extends State<GirisWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
    });

    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).background,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              Utils.assets('images/girisback.jpg'),
            ).image,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24, 44, 24, 0),
              child: Image.asset(
                Utils.assets('images/app.png'),
                width: MediaQuery.of(context).size.width * 0.65,
                height: 100,
                fit: BoxFit.contain,
              ).animated([animationsMap['imageOnPageLoadAnimation']]),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Color(0xC0C03A52),
                              Colors.transparent
                            ],
                            stops: [0, 0.5, 1],
                            begin: AlignmentDirectional(0.94, -1),
                            end: AlignmentDirectional(-0.94, 1),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(50),
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              25, 0, 25, 0),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CircadiandailywallpWidget(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 12, 0),
                                  child: Text(
                                    FFLocalizations.of(context)!.getText(
                                      'hmfdi66g' /* Circadian */,
                                    ),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .textColor,
                                          fontSize: 18,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.w200,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).animated([animationsMap['rowOnPageLoadAnimation1']]),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(32, 12, 32, 0),
                  child: Text(
                    FFLocalizations.of(context)!.getText(
                      'jmazejxe' /* from thousands of excellent pe... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).grayLight,
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ),
                  ).animated([animationsMap['textOnPageLoadAnimation1']]),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Color(0xC0C03A52),
                              Colors.transparent
                            ],
                            stops: [0, 0.5, 1],
                            begin: AlignmentDirectional(0.94, -1),
                            end: AlignmentDirectional(-0.94, 1),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(50),
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              25, 0, 25, 0),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CollectionsWidget(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 12, 0),
                                  child: Text(
                                    FFLocalizations.of(context)!.getText(
                                      '6uuzslri' /* Collections */,
                                    ),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .textColor,
                                          fontSize: 18,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.w200,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).animated([animationsMap['rowOnPageLoadAnimation2']]),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(32, 12, 32, 0),
                  child: Text(
                    FFLocalizations.of(context)!.getText(
                      'i4fphggi' /* compiled for you */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).grayLight,
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ),
                  ).animated([animationsMap['textOnPageLoadAnimation2']]),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 24, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KilavuzWidget(),
                            ),
                          );
                        },
                        text: FFLocalizations.of(context)!.getText(
                          '6qy9ft4f' /* Let's get to the tutorial */,
                        ),
                        options: FFButtonOptions(
                          width: 160,
                          height: 35,
                          color: const Color(0x27000000),
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).textColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                          elevation: 5,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 24, 12, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AyarlarWidget(),
                            ),
                          );
                        },
                        text: FFLocalizations.of(context)!.getText(
                          'i8ikl7b1' /* Settings */,
                        ),
                        options: FFButtonOptions(
                          width: 110,
                          height: 35,
                          color: const Color(0x25000000),
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).textColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                          elevation: 5,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(32, 12, 32, 0),
                  child: Text(
                    FFLocalizations.of(context)!.getText(
                      '7so9lilo' /* How about a little tour to get... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: const Color(0xB2FFFFFF),
                          fontSize: 9,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
              ],
            ).animated([animationsMap['columnOnPageLoadAnimation']]),
            const FlutterFlowAdBanner(
              width: 320,
              height: 50,
              showsTestAd: true,
              iOSAdUnitID: 'ca-app-pub-5455528914159263/6673061197',
              androidAdUnitID: 'ca-app-pub-5455528914159263/4322445623',
            ),
          ],
        ),
      ),
    );
  }
}
