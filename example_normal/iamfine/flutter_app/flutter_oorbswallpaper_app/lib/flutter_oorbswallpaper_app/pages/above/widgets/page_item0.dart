// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_oorbswallpaper_app/flutter_oorbswallpaper_app.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../indirildi/indirildi_widget.dart';
import '../../custom_code/actions/index.dart' as actions;

class Item0Widget extends StatelessWidget {
  Item0Widget({super.key});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                6, 0, 6, 6),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: 100,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).grayLight,
                                      FlutterFlowTheme.of(context).textColor
                                    ],
                                    stops: const [0, 1],
                                    begin: const AlignmentDirectional(0.94, -1),
                                    end: const AlignmentDirectional(-0.94, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    width: 0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 12, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.keyboard_control,
                                        color: FlutterFlowTheme.of(context)
                                            .grayDark,
                                        size: 24,
                                      ),
                                      Text(
                                        FFLocalizations.of(context)!.getText(
                                          '92ju4f0z' /* Stratosphere */,
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .title2
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayDark,
                                              fontSize: 20,
                                            ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context)!.getText(
                                          'c7abzjyd' /* "Icarus" */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayDark,
                                              fontSize: 12,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                6, 6, 6, 6),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: 35,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context).secondaryText,
                                    FlutterFlowTheme.of(context).background
                                  ],
                                  stops: const [0, 1],
                                  begin: const AlignmentDirectional(0.94, -1),
                                  end: const AlignmentDirectional(-0.94, 1),
                                ),
                                borderRadius: BorderRadius.circular(16),
                                shape: BoxShape.rectangle,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.google,
                                    color:
                                        FlutterFlowTheme.of(context).grayLight,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                6, 12, 6, 6),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Stack(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.network(
                                              'https://www.gstatic.com/prettyearth/assets/full/1102.jpg',
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: 'imageTag1',
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: 'imageTag1',
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          'https://www.gstatic.com/prettyearth/assets/full/1102.jpg',
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 4, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            await actions.downloadImage(
                                              'https://www.gstatic.com/prettyearth/assets/full/1102.jpg',
                                            );
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const IndirildiWidget(),
                                              ),
                                            );
                                          },
                                          child: const FaIcon(
                                            FontAwesomeIcons.circleChevronDown,
                                            color: Color(0x66FFFFFF),
                                            size: 45,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.network(
                                              '',
                                            ).image,
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 20,
                                              color: Color(0x7F000000),
                                              offset: Offset(0, 0),
                                              spreadRadius: 5,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          shape: BoxShape.rectangle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                6, 0, 6, 6),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: 100,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context).textColor,
                                    FlutterFlowTheme.of(context).grayLight
                                  ],
                                  stops: const [0, 1],
                                  begin: const AlignmentDirectional(0.94, -1),
                                  end: const AlignmentDirectional(-0.94, 1),
                                ),
                                borderRadius: BorderRadius.circular(16),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.format_quote_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).grayDark,
                                      size: 44,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 4, 0, 0),
                                      child: Text(
                                        FFLocalizations.of(context)!.getText(
                                          'mymsvliy' /* Icarus, son of Daidalus... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayDark,
                                              fontSize: 12,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                6, 12, 6, 6),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: 300,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.network(
                                    '',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Stack(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.network(
                                              'https://www.gstatic.com/prettyearth/assets/full/14575.jpg',
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: 'imageTag2',
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: 'imageTag2',
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          'https://www.gstatic.com/prettyearth/assets/full/14575.jpg',
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 4, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            await actions.downloadImage(
                                              'https://www.gstatic.com/prettyearth/assets/full/14575.jpg',
                                            );
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const IndirildiWidget(),
                                              ),
                                            );
                                          },
                                          child: const FaIcon(
                                            FontAwesomeIcons.circleChevronDown,
                                            color: Color(0x66FFFFFF),
                                            size: 45,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.network(
                                              '',
                                            ).image,
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 20,
                                              color: Color(0x7F000000),
                                              offset: Offset(0, 0),
                                              spreadRadius: 5,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          shape: BoxShape.rectangle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
