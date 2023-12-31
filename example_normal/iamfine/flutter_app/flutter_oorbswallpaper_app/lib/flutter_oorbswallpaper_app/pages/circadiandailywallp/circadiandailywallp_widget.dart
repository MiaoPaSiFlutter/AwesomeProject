// ignore_for_file: use_build_context_synchronously

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_oorbswallpaper_app/flutter_oorbswallpaper_app.dart';
import '../indirildi/indirildi_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../collections/collections_widget.dart';
import '../ayarlar/ayarlar_widget.dart';
import '../backend/api_requests/api_calls.dart';
import '../../flutter_flow/admob_util.dart' as admob;

class CircadiandailywallpWidget extends StatefulWidget {
  const CircadiandailywallpWidget({Key? key}) : super(key: key);

  @override
  _CircadiandailywallpWidgetState createState() =>
      _CircadiandailywallpWidgetState();
}

class _CircadiandailywallpWidgetState extends State<CircadiandailywallpWidget>
    with TickerProviderStateMixin {
  PageController? pageViewController10;
  bool interstitialAdSuccess23 = false;
  PageController? pageViewController1;
  PageController? pageViewController2;
  bool interstitialAdSuccess = false;
  PageController? pageViewController3;
  bool interstitialAdSuccessthanks = false;
  PageController? pageViewController4;
  bool interstitialAdSuccess123a = false;
  PageController? pageViewController5;
  bool interstitialAdSuccessb = false;
  PageController? pageViewController6;
  bool interstitialAdSuccessa = false;
  PageController? pageViewController7;
  bool interstitialAdSuccess1232 = false;
  PageController? pageViewController8;
  bool interstitialAdSuccess56 = false;
  PageController? pageViewController9;
  bool interstitialAdSuccess4 = false;
  PageController? pageViewController11;
  bool interstitialAdSuccess1 = false;
  PageController? pageViewController12;
  bool interstitialAdSucces = false;
  bool _showBackToTopButton = false;
  ScrollController? _scrollController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: const Offset(0, 30),
        scale: 0.1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: const Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: const Offset(0, 30),
        scale: 0.1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: const Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: const Offset(0, 30),
        scale: 0.1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: const Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: const Offset(0, 30),
        scale: 0.1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: const Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: const Offset(0, 30),
        scale: 0.1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: const Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: const Offset(0, 30),
        scale: 0.1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: const Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: const Offset(0, 30),
        scale: 0.1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: const Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: const Offset(0, 30),
        scale: 0.1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: const Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation9': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: const Offset(0, 30),
        scale: 0.1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: const Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation10': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: const Offset(0, 30),
        scale: 0.1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: const Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation11': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: const Offset(0, 30),
        scale: 0.1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: const Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if ((_scrollController?.offset ?? 0) >= 600) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      admob.loadInterstitialAd(
        "ca-app-pub-5455528914159263/3156240592",
        "ca-app-pub-5455528914159263/2165774311",
        false,
      );
    });

    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  void dispose() {
    _scrollController?.dispose(); // dispose the controller
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController?.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: const Color(0xFF14181B),
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context)!.getText(
              'kpmbqcrp' /* Circadian */,
            ),
            style: FlutterFlowTheme.of(context).title1.override(
                  fontFamily: 'Poppins',
                  color: const Color(0xCDFFFFFF),
                  fontSize: 28,
                  letterSpacing: 10,
                  fontWeight: FontWeight.w200,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: const Color(0xFF14181B),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image:
                  Image.asset(Utils.assets('images/collectionsback.jpg')).image,
            ),
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                      child: PageView(
                        controller: pageViewController1 ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 24, 24, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Color(0xC0C03A7A),
                                              Colors.transparent
                                            ],
                                            stops: [0, 0.5, 1],
                                            begin:
                                                AlignmentDirectional(0.94, -1),
                                            end: AlignmentDirectional(-0.94, 1),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(50),
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 48, 0),
                                              child: Text(
                                                FFLocalizations.of(context)!
                                                    .getText(
                                                  '5lukg317' /* Editorial */,
                                                ),
                                                textAlign: TextAlign.end,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                      fontSize: 18,
                                                      letterSpacing: 5,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).animated([
                                    animationsMap['rowOnPageLoadAnimation1']
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 12, 24, 0),
                                  child: Text(
                                    FFLocalizations.of(context)!.getText(
                                      'hb1zuzrg' /* Swipe right for different pers... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 11,
                                        ),
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse?>(
                                  future: OorbsapiWallpaperCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: SpinKitRipple(
                                            color: Color(0xFFDE405D),
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    }
                                    final columnOorbsapiWallpaperResponse =
                                        snapshot.data;
                                    return Builder(
                                      builder: (context) {
                                        final wallpaper = getJsonField(
                                              (columnOorbsapiWallpaperResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.*''',
                                            )?.toList() ??
                                            [];
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children:
                                                List.generate(wallpaper.length,
                                                    (wallpaperIndex) {
                                              final wallpaperItem =
                                                  wallpaper[wallpaperIndex];
                                              return Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        24, 24, 24, 24),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.7,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        getJsonField(
                                                          wallpaperItem,
                                                          r'''$.full''',
                                                        ),
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                      topLeft:
                                                          Radius.circular(0),
                                                      topRight:
                                                          Radius.circular(50),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0, 0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 65,
                                                                child: PageView(
                                                                  controller: pageViewController2 ??=
                                                                      PageController(
                                                                          initialPage:
                                                                              0),
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await actions
                                                                            .downloadImage(
                                                                          getJsonField(
                                                                            wallpaperItem,
                                                                            r'''$.download''',
                                                                          ).toString(),
                                                                        );
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                const IndirildiWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          ClipRect(
                                                                        child:
                                                                            BackdropFilter(
                                                                          filter:
                                                                              ImageFilter.blur(
                                                                            sigmaX:
                                                                                4,
                                                                            sigmaY:
                                                                                4,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  const Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(32, 0, 0, 0),
                                                                                    child: Icon(
                                                                                      Icons.cloud_download_outlined,
                                                                                      color: Color(0xCDFFFFFF),
                                                                                      size: 30,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context)!.getText(
                                                                                      'u8t5wqli' /* Tap to Download... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).textColor,
                                                                                          fontSize: 11,
                                                                                        ),
                                                                                  ),
                                                                                  const Align(
                                                                                    alignment: AlignmentDirectional(1, 0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 32, 0),
                                                                                      child: Icon(
                                                                                        Icons.chevron_left,
                                                                                        color: Color(0x80FFFFFF),
                                                                                        size: 14,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 150),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 16, 20, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)!
                                                  .getText(
                                                'i3f9lbuj' /* Would you like to support us? */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 0, 16, 32),
                                        child: InkWell(
                                          onTap: () async {
                                            interstitialAdSuccess = await admob
                                                .showInterstitialAd();

                                            setState(() {});
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.09,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .background,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(25),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(25),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24, 0, 0, 0),
                                                      child: Icon(
                                                        Icons.favorite_border,
                                                        color:
                                                            Color(0xC0C03A52),
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                24, 0, 24, 0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)!
                                                              .getText(
                                                            'omooonn7' /* When you click on the icon, yo... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 10,
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
                                      ),
                                      const FlutterFlowAdBanner(
                                        width: 320,
                                        height: 100,
                                        showsTestAd: false,
                                        iOSAdUnitID:
                                            'ca-app-pub-5455528914159263/6673061197',
                                        androidAdUnitID:
                                            'ca-app-pub-5455528914159263/4322445623',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 24, 24, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              FlutterFlowTheme.of(context)
                                                  .grayDark,
                                              Colors.transparent
                                            ],
                                            stops: [0, 0.5, 1],
                                            begin: const AlignmentDirectional(
                                                0.94, -1),
                                            end: const AlignmentDirectional(
                                                -0.94, 1),
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(50),
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 48, 0),
                                              child: Text(
                                                FFLocalizations.of(context)!
                                                    .getText(
                                                  'cxdgh3gk' /* Black */,
                                                ),
                                                textAlign: TextAlign.end,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                      fontSize: 18,
                                                      letterSpacing: 5,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).animated([
                                    animationsMap['rowOnPageLoadAnimation2']
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 12, 24, 0),
                                  child: Text(
                                    FFLocalizations.of(context)!.getText(
                                      'b78miquy' /* Swipe right for different pers... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 11,
                                        ),
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse?>(
                                  future: OorbsapiBlackCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: SpinKitRipple(
                                            color: Color(0xFFDE405D),
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    }
                                    final columnOorbsapiBlackResponse =
                                        snapshot.data;
                                    return Builder(
                                      builder: (context) {
                                        final black = getJsonField(
                                              (columnOorbsapiBlackResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.*''',
                                            )?.toList() ??
                                            [];
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                black.length, (blackIndex) {
                                              final blackItem =
                                                  black[blackIndex];
                                              return Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        24, 24, 24, 24),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.7,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        getJsonField(
                                                          blackItem,
                                                          r'''$.full''',
                                                        ),
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                      topLeft:
                                                          Radius.circular(0),
                                                      topRight:
                                                          Radius.circular(50),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0, 0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 65,
                                                                child: PageView(
                                                                  controller: pageViewController3 ??=
                                                                      PageController(
                                                                          initialPage:
                                                                              0),
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await actions
                                                                            .downloadImage(
                                                                          getJsonField(
                                                                            blackItem,
                                                                            r'''$.download''',
                                                                          ).toString(),
                                                                        );
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                const IndirildiWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          ClipRect(
                                                                        child:
                                                                            BackdropFilter(
                                                                          filter:
                                                                              ImageFilter.blur(
                                                                            sigmaX:
                                                                                4,
                                                                            sigmaY:
                                                                                4,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  const Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(32, 0, 0, 0),
                                                                                    child: Icon(
                                                                                      Icons.cloud_download_outlined,
                                                                                      color: Color(0xCDFFFFFF),
                                                                                      size: 30,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context)!.getText(
                                                                                      '1knpv1zp' /* Tap to Download... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: const Color(0xCDFFFFFF),
                                                                                          fontSize: 11,
                                                                                        ),
                                                                                  ),
                                                                                  const Align(
                                                                                    alignment: AlignmentDirectional(1, 0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 32, 0),
                                                                                      child: Icon(
                                                                                        Icons.chevron_left,
                                                                                        color: Color(0x80FFFFFF),
                                                                                        size: 14,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 150),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 16, 20, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)!
                                                  .getText(
                                                'q3zyimd4' /* Would you like to support us? */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 0, 16, 32),
                                        child: InkWell(
                                          onTap: () async {
                                            interstitialAdSuccessthanks =
                                                await admob
                                                    .showInterstitialAd();

                                            setState(() {});
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.09,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .background,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(25),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(25),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24, 0, 0, 0),
                                                      child: Icon(
                                                        Icons.favorite_border,
                                                        color:
                                                            Color(0xC0C03A52),
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                24, 0, 24, 0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)!
                                                              .getText(
                                                            'g2v4fpea' /* When you click on the icon, yo... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 10,
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
                                      ),
                                      const FlutterFlowAdBanner(
                                        width: 320,
                                        height: 100,
                                        showsTestAd: false,
                                        iOSAdUnitID:
                                            'ca-app-pub-5455528914159263/6673061197',
                                        androidAdUnitID:
                                            'ca-app-pub-5455528914159263/4322445623',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 24, 24, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Color(0xC0663AC0),
                                              Colors.transparent
                                            ],
                                            stops: [0, 0.5, 1],
                                            begin:
                                                AlignmentDirectional(0.94, -1),
                                            end: AlignmentDirectional(-0.94, 1),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(50),
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 48, 0),
                                              child: Text(
                                                FFLocalizations.of(context)!
                                                    .getText(
                                                  'vuj33wwh' /* Abstract */,
                                                ),
                                                textAlign: TextAlign.end,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                      fontSize: 18,
                                                      letterSpacing: 5,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).animated([
                                    animationsMap['rowOnPageLoadAnimation3']
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 12, 24, 0),
                                  child: Text(
                                    FFLocalizations.of(context)!.getText(
                                      'aotgr2a6' /* Swipe right for different pers... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 11,
                                        ),
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse?>(
                                  future: OorbsapiAbstractCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: SpinKitRipple(
                                            color: Color(0xFFDE405D),
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    }
                                    final columnOorbsapiAbstractResponse =
                                        snapshot.data;
                                    return Builder(
                                      builder: (context) {
                                        final abstract = getJsonField(
                                              (columnOorbsapiAbstractResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.*''',
                                            )?.toList() ??
                                            [];
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children:
                                                List.generate(abstract.length,
                                                    (abstractIndex) {
                                              final abstractItem =
                                                  abstract[abstractIndex];
                                              return Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        24, 24, 24, 24),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.7,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        getJsonField(
                                                          abstractItem,
                                                          r'''$.full''',
                                                        ),
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                      topLeft:
                                                          Radius.circular(0),
                                                      topRight:
                                                          Radius.circular(50),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0, 0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 65,
                                                                child: PageView(
                                                                  controller: pageViewController4 ??=
                                                                      PageController(
                                                                          initialPage:
                                                                              0),
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await actions
                                                                            .downloadImage(
                                                                          getJsonField(
                                                                            abstractItem,
                                                                            r'''$.download''',
                                                                          ).toString(),
                                                                        );
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                const IndirildiWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          ClipRect(
                                                                        child:
                                                                            BackdropFilter(
                                                                          filter:
                                                                              ImageFilter.blur(
                                                                            sigmaX:
                                                                                4,
                                                                            sigmaY:
                                                                                4,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  const Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(32, 0, 0, 0),
                                                                                    child: Icon(
                                                                                      Icons.cloud_download_outlined,
                                                                                      color: Color(0xCDFFFFFF),
                                                                                      size: 30,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context)!.getText(
                                                                                      'sx8gyyya' /* Tap to Download... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: const Color(0xCDFFFFFF),
                                                                                          fontSize: 11,
                                                                                        ),
                                                                                  ),
                                                                                  const Align(
                                                                                    alignment: AlignmentDirectional(1, 0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 32, 0),
                                                                                      child: Icon(
                                                                                        Icons.chevron_left,
                                                                                        color: Color(0x80FFFFFF),
                                                                                        size: 14,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 150),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 16, 20, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)!
                                                  .getText(
                                                'bbevk8h1' /* Would you like to support us? */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 0, 16, 32),
                                        child: InkWell(
                                          onTap: () async {
                                            interstitialAdSuccess123a =
                                                await admob
                                                    .showInterstitialAd();

                                            setState(() {});
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.09,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .background,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(25),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(25),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24, 0, 0, 0),
                                                      child: Icon(
                                                        Icons.favorite_border,
                                                        color:
                                                            Color(0xC0C03A52),
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                24, 0, 24, 0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)!
                                                              .getText(
                                                            'pqu9verd' /* When you click on the icon, yo... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 10,
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
                                      ),
                                      const FlutterFlowAdBanner(
                                        width: 320,
                                        height: 100,
                                        showsTestAd: false,
                                        iOSAdUnitID:
                                            'ca-app-pub-5455528914159263/6673061197',
                                        androidAdUnitID:
                                            'ca-app-pub-5455528914159263/4322445623',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 24, 24, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Color(0xC03AC09F),
                                              Colors.transparent
                                            ],
                                            stops: [0, 0.5, 1],
                                            begin:
                                                AlignmentDirectional(0.94, -1),
                                            end: AlignmentDirectional(-0.94, 1),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(50),
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 48, 0),
                                              child: Text(
                                                FFLocalizations.of(context)!
                                                    .getText(
                                                  'qdv3dfgn' /* Minimal */,
                                                ),
                                                textAlign: TextAlign.end,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                      fontSize: 18,
                                                      letterSpacing: 5,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).animated([
                                    animationsMap['rowOnPageLoadAnimation4']
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 12, 24, 0),
                                  child: Text(
                                    FFLocalizations.of(context)!.getText(
                                      'f6ctdrlw' /* Swipe right for different pers... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 11,
                                        ),
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse?>(
                                  future: OorbsapiMinimalCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: SpinKitRipple(
                                            color: Color(0xFFDE405D),
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    }
                                    final columnOorbsapiMinimalResponse =
                                        snapshot.data;
                                    return Builder(
                                      builder: (context) {
                                        final minimal = getJsonField(
                                              (columnOorbsapiMinimalResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.*''',
                                            )?.toList() ??
                                            [];
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                minimal.length, (minimalIndex) {
                                              final minimalItem =
                                                  minimal[minimalIndex];
                                              return Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        24, 24, 24, 24),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.7,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        getJsonField(
                                                          minimalItem,
                                                          r'''$.full''',
                                                        ),
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                      topLeft:
                                                          Radius.circular(0),
                                                      topRight:
                                                          Radius.circular(50),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0, 0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 65,
                                                                child: PageView(
                                                                  controller: pageViewController5 ??=
                                                                      PageController(
                                                                          initialPage:
                                                                              0),
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await actions
                                                                            .downloadImage(
                                                                          getJsonField(
                                                                            minimalItem,
                                                                            r'''$.download''',
                                                                          ).toString(),
                                                                        );
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                const IndirildiWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          ClipRect(
                                                                        child:
                                                                            BackdropFilter(
                                                                          filter:
                                                                              ImageFilter.blur(
                                                                            sigmaX:
                                                                                4,
                                                                            sigmaY:
                                                                                4,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  const Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(32, 0, 0, 0),
                                                                                    child: Icon(
                                                                                      Icons.cloud_download_outlined,
                                                                                      color: Color(0xCDFFFFFF),
                                                                                      size: 30,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context)!.getText(
                                                                                      'mtz9a8sj' /* Tap to Download... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: const Color(0xCDFFFFFF),
                                                                                          fontSize: 11,
                                                                                        ),
                                                                                  ),
                                                                                  const Align(
                                                                                    alignment: AlignmentDirectional(1, 0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 32, 0),
                                                                                      child: Icon(
                                                                                        Icons.chevron_left,
                                                                                        color: Color(0x80FFFFFF),
                                                                                        size: 14,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 150),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 16, 20, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)!
                                                  .getText(
                                                'ifh10h3s' /* Would you like to support us? */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 0, 16, 32),
                                        child: InkWell(
                                          onTap: () async {
                                            interstitialAdSuccessb = await admob
                                                .showInterstitialAd();

                                            setState(() {});
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.09,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .background,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(25),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(25),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24, 0, 0, 0),
                                                      child: Icon(
                                                        Icons.favorite_border,
                                                        color:
                                                            Color(0xC0C03A52),
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                24, 0, 24, 0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)!
                                                              .getText(
                                                            '5vcpixpe' /* When you click on the icon, yo... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 10,
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
                                      ),
                                      const FlutterFlowAdBanner(
                                        width: 320,
                                        height: 100,
                                        showsTestAd: false,
                                        iOSAdUnitID:
                                            'ca-app-pub-5455528914159263/6673061197',
                                        androidAdUnitID:
                                            'ca-app-pub-5455528914159263/4322445623',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 24, 24, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Color(0xC0C0553A),
                                              Colors.transparent
                                            ],
                                            stops: [0, 0.5, 1],
                                            begin:
                                                AlignmentDirectional(0.94, -1),
                                            end: AlignmentDirectional(-0.94, 1),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(50),
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 48, 0),
                                              child: Text(
                                                FFLocalizations.of(context)!
                                                    .getText(
                                                  'z2uqgvsb' /* Space */,
                                                ),
                                                textAlign: TextAlign.end,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                      fontSize: 18,
                                                      letterSpacing: 5,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).animated([
                                    animationsMap['rowOnPageLoadAnimation5']
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 12, 24, 0),
                                  child: Text(
                                    FFLocalizations.of(context)!.getText(
                                      'kt1yft65' /* Swipe right for different pers... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 11,
                                        ),
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse?>(
                                  future: OorbsapiSpaceCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: SpinKitRipple(
                                            color: Color(0xFFDE405D),
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    }
                                    final columnOorbsapiSpaceResponse =
                                        snapshot.data;
                                    return Builder(
                                      builder: (context) {
                                        final space = getJsonField(
                                              (columnOorbsapiSpaceResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.*''',
                                            )?.toList() ??
                                            [];
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                space.length, (spaceIndex) {
                                              final spaceItem =
                                                  space[spaceIndex];
                                              return Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        24, 24, 24, 24),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.7,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        getJsonField(
                                                          spaceItem,
                                                          r'''$.full''',
                                                        ),
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                      topLeft:
                                                          Radius.circular(0),
                                                      topRight:
                                                          Radius.circular(50),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0, 0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 65,
                                                                child: PageView(
                                                                  controller: pageViewController6 ??=
                                                                      PageController(
                                                                          initialPage:
                                                                              0),
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await actions
                                                                            .downloadImage(
                                                                          getJsonField(
                                                                            spaceItem,
                                                                            r'''$.download''',
                                                                          ).toString(),
                                                                        );
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                const IndirildiWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          ClipRect(
                                                                        child:
                                                                            BackdropFilter(
                                                                          filter:
                                                                              ImageFilter.blur(
                                                                            sigmaX:
                                                                                4,
                                                                            sigmaY:
                                                                                4,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  const Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(32, 0, 0, 0),
                                                                                    child: Icon(
                                                                                      Icons.cloud_download_outlined,
                                                                                      color: Color(0xCDFFFFFF),
                                                                                      size: 30,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context)!.getText(
                                                                                      'krn6gpe8' /* Tap to Download... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: const Color(0xCDFFFFFF),
                                                                                          fontSize: 11,
                                                                                        ),
                                                                                  ),
                                                                                  const Align(
                                                                                    alignment: AlignmentDirectional(1, 0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 32, 0),
                                                                                      child: Icon(
                                                                                        Icons.chevron_left,
                                                                                        color: Color(0x80FFFFFF),
                                                                                        size: 14,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 150),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 16, 20, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)!
                                                  .getText(
                                                'pft5vqtr' /* Would you like to support us? */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 0, 16, 32),
                                        child: InkWell(
                                          onTap: () async {
                                            interstitialAdSuccessa = await admob
                                                .showInterstitialAd();

                                            setState(() {});
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.09,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .background,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(25),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(25),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24, 0, 0, 0),
                                                      child: Icon(
                                                        Icons.favorite_border,
                                                        color:
                                                            Color(0xC0C03A52),
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                24, 0, 24, 0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)!
                                                              .getText(
                                                            '9e8wejpf' /* When you click on the icon, yo... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 10,
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
                                      ),
                                      const FlutterFlowAdBanner(
                                        width: 320,
                                        height: 100,
                                        showsTestAd: false,
                                        iOSAdUnitID:
                                            'ca-app-pub-5455528914159263/6673061197',
                                        androidAdUnitID:
                                            'ca-app-pub-5455528914159263/4322445623',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 24, 24, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Color(0xC0C03A3A),
                                              Colors.transparent
                                            ],
                                            stops: [0, 0.5, 1],
                                            begin:
                                                AlignmentDirectional(0.94, -1),
                                            end: AlignmentDirectional(-0.94, 1),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(50),
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 48, 0),
                                              child: Text(
                                                FFLocalizations.of(context)!
                                                    .getText(
                                                  'ono9xl19' /* Neon */,
                                                ),
                                                textAlign: TextAlign.end,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                      fontSize: 18,
                                                      letterSpacing: 5,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).animated([
                                    animationsMap['rowOnPageLoadAnimation6']
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 12, 24, 0),
                                  child: Text(
                                    FFLocalizations.of(context)!.getText(
                                      'kg594aph' /* Swipe right for different pers... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 11,
                                        ),
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse?>(
                                  future: OorbsapiNeonCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: SpinKitRipple(
                                            color: Color(0xFFDE405D),
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    }
                                    final columnOorbsapiNeonResponse =
                                        snapshot.data;
                                    return Builder(
                                      builder: (context) {
                                        final neon = getJsonField(
                                              (columnOorbsapiNeonResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.*''',
                                            )?.toList() ??
                                            [];
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(neon.length,
                                                (neonIndex) {
                                              final neonItem = neon[neonIndex];
                                              return Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        24, 24, 24, 24),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.7,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        getJsonField(
                                                          neonItem,
                                                          r'''$.full''',
                                                        ),
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                      topLeft:
                                                          Radius.circular(0),
                                                      topRight:
                                                          Radius.circular(50),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0, 0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 65,
                                                                child: PageView(
                                                                  controller: pageViewController7 ??=
                                                                      PageController(
                                                                          initialPage:
                                                                              0),
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await actions
                                                                            .downloadImage(
                                                                          getJsonField(
                                                                            neonItem,
                                                                            r'''$.download''',
                                                                          ).toString(),
                                                                        );
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                const IndirildiWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          ClipRect(
                                                                        child:
                                                                            BackdropFilter(
                                                                          filter:
                                                                              ImageFilter.blur(
                                                                            sigmaX:
                                                                                4,
                                                                            sigmaY:
                                                                                4,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  const Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(32, 0, 0, 0),
                                                                                    child: Icon(
                                                                                      Icons.cloud_download_outlined,
                                                                                      color: Color(0xCDFFFFFF),
                                                                                      size: 30,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context)!.getText(
                                                                                      'p99lq0lt' /* Tap to Download... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: const Color(0xCDFFFFFF),
                                                                                          fontSize: 11,
                                                                                        ),
                                                                                  ),
                                                                                  const Align(
                                                                                    alignment: AlignmentDirectional(1, 0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 32, 0),
                                                                                      child: Icon(
                                                                                        Icons.chevron_left,
                                                                                        color: Color(0x80FFFFFF),
                                                                                        size: 14,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 150),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 16, 20, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)!
                                                  .getText(
                                                'uf98zt75' /* Would you like to support us? */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 0, 16, 32),
                                        child: InkWell(
                                          onTap: () async {
                                            interstitialAdSuccess1232 =
                                                await admob
                                                    .showInterstitialAd();

                                            setState(() {});
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.09,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .background,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(25),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(25),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24, 0, 0, 0),
                                                      child: Icon(
                                                        Icons.favorite_border,
                                                        color:
                                                            Color(0xC0C03A52),
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                24, 0, 24, 0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)!
                                                              .getText(
                                                            'sgbm8qdb' /* When you click on the icon, yo... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 10,
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
                                      ),
                                      const FlutterFlowAdBanner(
                                        width: 320,
                                        height: 100,
                                        showsTestAd: false,
                                        iOSAdUnitID:
                                            'ca-app-pub-5455528914159263/6673061197',
                                        androidAdUnitID:
                                            'ca-app-pub-5455528914159263/4322445623',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 24, 24, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Color(0xC03AC0A4),
                                              Colors.transparent
                                            ],
                                            stops: [0, 0.5, 1],
                                            begin:
                                                AlignmentDirectional(0.94, -1),
                                            end: AlignmentDirectional(-0.94, 1),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(50),
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 48, 0),
                                              child: Text(
                                                FFLocalizations.of(context)!
                                                    .getText(
                                                  'vm3hgu15' /* Night */,
                                                ),
                                                textAlign: TextAlign.end,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                      fontSize: 18,
                                                      letterSpacing: 5,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).animated([
                                    animationsMap['rowOnPageLoadAnimation7']
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 12, 24, 0),
                                  child: Text(
                                    FFLocalizations.of(context)!.getText(
                                      'il5adsji' /* Swipe right for different pers... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 11,
                                        ),
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse?>(
                                  future: OorbsapiNightCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: SpinKitRipple(
                                            color: Color(0xFFDE405D),
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    }
                                    final columnOorbsapiNightResponse =
                                        snapshot.data;
                                    return Builder(
                                      builder: (context) {
                                        final night = getJsonField(
                                              (columnOorbsapiNightResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.*''',
                                            )?.toList() ??
                                            [];
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                night.length, (nightIndex) {
                                              final nightItem =
                                                  night[nightIndex];
                                              return Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        24, 24, 24, 24),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.7,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        getJsonField(
                                                          nightItem,
                                                          r'''$.full''',
                                                        ),
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                      topLeft:
                                                          Radius.circular(0),
                                                      topRight:
                                                          Radius.circular(50),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0, 0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 65,
                                                                child: PageView(
                                                                  controller: pageViewController8 ??=
                                                                      PageController(
                                                                          initialPage:
                                                                              0),
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await actions
                                                                            .downloadImage(
                                                                          getJsonField(
                                                                            nightItem,
                                                                            r'''$.download''',
                                                                          ).toString(),
                                                                        );
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                const IndirildiWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          ClipRect(
                                                                        child:
                                                                            BackdropFilter(
                                                                          filter:
                                                                              ImageFilter.blur(
                                                                            sigmaX:
                                                                                4,
                                                                            sigmaY:
                                                                                4,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  const Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(32, 0, 0, 0),
                                                                                    child: Icon(
                                                                                      Icons.cloud_download_outlined,
                                                                                      color: Color(0xCDFFFFFF),
                                                                                      size: 30,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context)!.getText(
                                                                                      '3zmntut0' /* Tap to Download... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: const Color(0xCDFFFFFF),
                                                                                          fontSize: 11,
                                                                                        ),
                                                                                  ),
                                                                                  const Align(
                                                                                    alignment: AlignmentDirectional(1, 0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 32, 0),
                                                                                      child: Icon(
                                                                                        Icons.chevron_left,
                                                                                        color: Color(0x80FFFFFF),
                                                                                        size: 14,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 150),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 16, 20, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)!
                                                  .getText(
                                                'pnmliwwv' /* Would you like to support us? */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 0, 16, 32),
                                        child: InkWell(
                                          onTap: () async {
                                            interstitialAdSuccess56 =
                                                await admob
                                                    .showInterstitialAd();

                                            setState(() {});
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.09,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .background,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(25),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(25),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24, 0, 0, 0),
                                                      child: Icon(
                                                        Icons.favorite_border,
                                                        color:
                                                            Color(0xC0C03A52),
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                24, 0, 24, 0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)!
                                                              .getText(
                                                            '3ezhbwwk' /* When you click on the icon, yo... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 10,
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
                                      ),
                                      const FlutterFlowAdBanner(
                                        width: 320,
                                        height: 100,
                                        showsTestAd: false,
                                        iOSAdUnitID:
                                            'ca-app-pub-5455528914159263/6673061197',
                                        androidAdUnitID:
                                            'ca-app-pub-5455528914159263/4322445623',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 24, 24, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Color(0xC0C09F3A),
                                              Colors.transparent
                                            ],
                                            stops: [0, 0.5, 1],
                                            begin:
                                                AlignmentDirectional(0.94, -1),
                                            end: AlignmentDirectional(-0.94, 1),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(50),
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 48, 0),
                                              child: Text(
                                                FFLocalizations.of(context)!
                                                    .getText(
                                                  'zclpk5pn' /* Art */,
                                                ),
                                                textAlign: TextAlign.end,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                      fontSize: 18,
                                                      letterSpacing: 5,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).animated([
                                    animationsMap['rowOnPageLoadAnimation8']
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 12, 24, 0),
                                  child: Text(
                                    FFLocalizations.of(context)!.getText(
                                      'pecfz8zk' /* Swipe right for different pers... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 11,
                                        ),
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse?>(
                                  future: OorbsapiArtCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: SpinKitRipple(
                                            color: Color(0xFFDE405D),
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    }
                                    final columnOorbsapiArtResponse =
                                        snapshot.data;
                                    return Builder(
                                      builder: (context) {
                                        final art = getJsonField(
                                              (columnOorbsapiArtResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.*''',
                                            )?.toList() ??
                                            [];
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(art.length,
                                                (artIndex) {
                                              final artItem = art[artIndex];
                                              return Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        24, 24, 24, 24),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.7,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        getJsonField(
                                                          artItem,
                                                          r'''$.full''',
                                                        ),
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                      topLeft:
                                                          Radius.circular(0),
                                                      topRight:
                                                          Radius.circular(50),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0, 0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 65,
                                                                child: PageView(
                                                                  controller: pageViewController9 ??=
                                                                      PageController(
                                                                          initialPage:
                                                                              0),
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await actions
                                                                            .downloadImage(
                                                                          getJsonField(
                                                                            artItem,
                                                                            r'''$.download''',
                                                                          ).toString(),
                                                                        );
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                const IndirildiWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          ClipRect(
                                                                        child:
                                                                            BackdropFilter(
                                                                          filter:
                                                                              ImageFilter.blur(
                                                                            sigmaX:
                                                                                4,
                                                                            sigmaY:
                                                                                4,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  const Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(32, 0, 0, 0),
                                                                                    child: Icon(
                                                                                      Icons.cloud_download_outlined,
                                                                                      color: Color(0xCDFFFFFF),
                                                                                      size: 30,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context)!.getText(
                                                                                      '0twfjhqi' /* Tap to Download... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: const Color(0xCDFFFFFF),
                                                                                          fontSize: 11,
                                                                                        ),
                                                                                  ),
                                                                                  const Align(
                                                                                    alignment: AlignmentDirectional(1, 0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 32, 0),
                                                                                      child: Icon(
                                                                                        Icons.chevron_left,
                                                                                        color: Color(0x80FFFFFF),
                                                                                        size: 14,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 150),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 16, 20, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)!
                                                  .getText(
                                                '1xbz62wr' /* Would you like to support us? */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 0, 16, 32),
                                        child: InkWell(
                                          onTap: () async {
                                            interstitialAdSuccess4 = await admob
                                                .showInterstitialAd();

                                            setState(() {});
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.09,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .background,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(25),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(25),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24, 0, 0, 0),
                                                      child: Icon(
                                                        Icons.favorite_border,
                                                        color:
                                                            Color(0xC0C03A52),
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                24, 0, 24, 0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)!
                                                              .getText(
                                                            'e5hv100r' /* When you click on the icon, yo... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 10,
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
                                      ),
                                      const FlutterFlowAdBanner(
                                        width: 320,
                                        height: 100,
                                        showsTestAd: false,
                                        iOSAdUnitID:
                                            'ca-app-pub-5455528914159263/6673061197',
                                        androidAdUnitID:
                                            'ca-app-pub-5455528914159263/4322445623',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 24, 24, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Color(0xC0BFBFBF),
                                              Colors.transparent
                                            ],
                                            stops: [0, 0.5, 1],
                                            begin:
                                                AlignmentDirectional(0.94, -1),
                                            end: AlignmentDirectional(-0.94, 1),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(50),
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 48, 0),
                                              child: Text(
                                                FFLocalizations.of(context)!
                                                    .getText(
                                                  'ztle2eou' /* Vintage */,
                                                ),
                                                textAlign: TextAlign.end,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                      fontSize: 18,
                                                      letterSpacing: 5,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).animated([
                                    animationsMap['rowOnPageLoadAnimation9']
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 12, 24, 0),
                                  child: Text(
                                    FFLocalizations.of(context)!.getText(
                                      '3g9m677j' /* Swipe right for different pers... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 11,
                                        ),
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse?>(
                                  future: OorbsapiVintageCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: SpinKitRipple(
                                            color: Color(0xFFDE405D),
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    }
                                    final columnOorbsapiVintageResponse =
                                        snapshot.data;
                                    return Builder(
                                      builder: (context) {
                                        final vintage = getJsonField(
                                              (columnOorbsapiVintageResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.*''',
                                            )?.toList() ??
                                            [];
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                vintage.length, (vintageIndex) {
                                              final vintageItem =
                                                  vintage[vintageIndex];
                                              return Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        24, 24, 24, 24),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.7,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        getJsonField(
                                                          vintageItem,
                                                          r'''$.full''',
                                                        ),
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                      topLeft:
                                                          Radius.circular(0),
                                                      topRight:
                                                          Radius.circular(50),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0, 0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 65,
                                                                child: PageView(
                                                                  controller: pageViewController10 ??=
                                                                      PageController(
                                                                          initialPage:
                                                                              0),
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await actions
                                                                            .downloadImage(
                                                                          getJsonField(
                                                                            vintageItem,
                                                                            r'''$.download''',
                                                                          ).toString(),
                                                                        );
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                const IndirildiWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          ClipRect(
                                                                        child:
                                                                            BackdropFilter(
                                                                          filter:
                                                                              ImageFilter.blur(
                                                                            sigmaX:
                                                                                4,
                                                                            sigmaY:
                                                                                4,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  const Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(32, 0, 0, 0),
                                                                                    child: Icon(
                                                                                      Icons.cloud_download_outlined,
                                                                                      color: Color(0xCDFFFFFF),
                                                                                      size: 30,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context)!.getText(
                                                                                      'ple0cnhl' /* Tap to Download... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: const Color(0xCDFFFFFF),
                                                                                          fontSize: 11,
                                                                                        ),
                                                                                  ),
                                                                                  const Align(
                                                                                    alignment: AlignmentDirectional(1, 0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 32, 0),
                                                                                      child: Icon(
                                                                                        Icons.chevron_left,
                                                                                        color: Color(0x80FFFFFF),
                                                                                        size: 14,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 150),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 16, 20, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)!
                                                  .getText(
                                                'cik6z35v' /* Would you like to support us? */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 0, 16, 32),
                                        child: InkWell(
                                          onTap: () async {
                                            interstitialAdSuccess23 =
                                                await admob
                                                    .showInterstitialAd();

                                            setState(() {});
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.09,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .background,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(25),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(25),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24, 0, 0, 0),
                                                      child: Icon(
                                                        Icons.favorite_border,
                                                        color:
                                                            Color(0xC0C03A52),
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                24, 0, 24, 0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)!
                                                              .getText(
                                                            '348h6f42' /* When you click on the icon, yo... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 10,
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
                                      ),
                                      const FlutterFlowAdBanner(
                                        width: 320,
                                        height: 100,
                                        showsTestAd: false,
                                        iOSAdUnitID:
                                            'ca-app-pub-5455528914159263/6673061197',
                                        androidAdUnitID:
                                            'ca-app-pub-5455528914159263/4322445623',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 24, 24, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Color(0xC03F3AC0),
                                              Colors.transparent
                                            ],
                                            stops: [0, 0.5, 1],
                                            begin:
                                                AlignmentDirectional(0.94, -1),
                                            end: AlignmentDirectional(-0.94, 1),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(50),
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 48, 0),
                                              child: Text(
                                                FFLocalizations.of(context)!
                                                    .getText(
                                                  'nztypui7' /* City */,
                                                ),
                                                textAlign: TextAlign.end,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                      fontSize: 18,
                                                      letterSpacing: 5,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).animated([
                                    animationsMap['rowOnPageLoadAnimation10']
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 12, 24, 0),
                                  child: Text(
                                    FFLocalizations.of(context)!.getText(
                                      'xl1j72mz' /* Swipe right for different pers... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 11,
                                        ),
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse?>(
                                  future: OorbsapiCityCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: SpinKitRipple(
                                            color: Color(0xFFDE405D),
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    }
                                    final columnOorbsapiCityResponse =
                                        snapshot.data;
                                    return Builder(
                                      builder: (context) {
                                        final city = getJsonField(
                                              (columnOorbsapiCityResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.*''',
                                            )?.toList() ??
                                            [];
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(city.length,
                                                (cityIndex) {
                                              final cityItem = city[cityIndex];
                                              return Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        24, 24, 24, 24),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.7,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        getJsonField(
                                                          cityItem,
                                                          r'''$.full''',
                                                        ),
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                      topLeft:
                                                          Radius.circular(0),
                                                      topRight:
                                                          Radius.circular(50),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0, 0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 65,
                                                                child: PageView(
                                                                  controller: pageViewController11 ??=
                                                                      PageController(
                                                                          initialPage:
                                                                              0),
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await actions
                                                                            .downloadImage(
                                                                          getJsonField(
                                                                            cityItem,
                                                                            r'''$.download''',
                                                                          ).toString(),
                                                                        );
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                const IndirildiWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          ClipRect(
                                                                        child:
                                                                            BackdropFilter(
                                                                          filter:
                                                                              ImageFilter.blur(
                                                                            sigmaX:
                                                                                4,
                                                                            sigmaY:
                                                                                4,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  const Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(32, 0, 0, 0),
                                                                                    child: Icon(
                                                                                      Icons.cloud_download_outlined,
                                                                                      color: Color(0xCDFFFFFF),
                                                                                      size: 30,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context)!.getText(
                                                                                      'hxu3rp28' /* Tap to Download... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: const Color(0xCDFFFFFF),
                                                                                          fontSize: 11,
                                                                                        ),
                                                                                  ),
                                                                                  const Align(
                                                                                    alignment: AlignmentDirectional(1, 0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 32, 0),
                                                                                      child: Icon(
                                                                                        Icons.chevron_left,
                                                                                        color: Color(0x80FFFFFF),
                                                                                        size: 14,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 150),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 16, 20, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)!
                                                  .getText(
                                                '4io7gohu' /* Would you like to support us? */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 0, 16, 32),
                                        child: InkWell(
                                          onTap: () async {
                                            interstitialAdSuccess1 = await admob
                                                .showInterstitialAd();

                                            setState(() {});
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.09,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .background,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(25),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(25),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24, 0, 0, 0),
                                                      child: Icon(
                                                        Icons.favorite_border,
                                                        color:
                                                            Color(0xC0C03A52),
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                24, 0, 24, 0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)!
                                                              .getText(
                                                            'ntte1yhu' /* When you click on the icon, yo... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 10,
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
                                      ),
                                      const FlutterFlowAdBanner(
                                        width: 320,
                                        height: 100,
                                        showsTestAd: false,
                                        iOSAdUnitID:
                                            'ca-app-pub-5455528914159263/6673061197',
                                        androidAdUnitID:
                                            'ca-app-pub-5455528914159263/4322445623',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 24, 24, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Color(0xC03AC03D),
                                              Colors.transparent
                                            ],
                                            stops: [0, 0.5, 1],
                                            begin:
                                                AlignmentDirectional(0.94, -1),
                                            end: AlignmentDirectional(-0.94, 1),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(50),
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 48, 0),
                                              child: Text(
                                                FFLocalizations.of(context)!
                                                    .getText(
                                                  'cy03nkf7' /* Nature */,
                                                ),
                                                textAlign: TextAlign.end,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                      fontSize: 18,
                                                      letterSpacing: 5,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).animated([
                                    animationsMap['rowOnPageLoadAnimation11']
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 12, 24, 0),
                                  child: Text(
                                    FFLocalizations.of(context)!.getText(
                                      'us9grynw' /* New Circadians will always be ... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 11,
                                        ),
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse?>(
                                  future: OorbsapiNatureCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: SpinKitRipple(
                                            color: Color(0xFFDE405D),
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    }
                                    final columnOorbsapiNatureResponse =
                                        snapshot.data;
                                    return Builder(
                                      builder: (context) {
                                        final nature = getJsonField(
                                              (columnOorbsapiNatureResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.*''',
                                            )?.toList() ??
                                            [];
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                nature.length, (natureIndex) {
                                              final natureItem =
                                                  nature[natureIndex];
                                              return Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        24, 24, 24, 24),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.7,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        getJsonField(
                                                          natureItem,
                                                          r'''$.full''',
                                                        ),
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                      topLeft:
                                                          Radius.circular(0),
                                                      topRight:
                                                          Radius.circular(50),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0, 0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 65,
                                                                child: PageView(
                                                                  controller: pageViewController12 ??=
                                                                      PageController(
                                                                          initialPage:
                                                                              0),
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await actions
                                                                            .downloadImage(
                                                                          getJsonField(
                                                                            natureItem,
                                                                            r'''$.download''',
                                                                          ).toString(),
                                                                        );
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                const IndirildiWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          ClipRect(
                                                                        child:
                                                                            BackdropFilter(
                                                                          filter:
                                                                              ImageFilter.blur(
                                                                            sigmaX:
                                                                                4,
                                                                            sigmaY:
                                                                                4,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  const Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(32, 0, 0, 0),
                                                                                    child: Icon(
                                                                                      Icons.cloud_download_outlined,
                                                                                      color: Color(0xCDFFFFFF),
                                                                                      size: 30,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context)!.getText(
                                                                                      'djzjmlcr' /* Tap to Download... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: const Color(0xCDFFFFFF),
                                                                                          fontSize: 11,
                                                                                        ),
                                                                                  ),
                                                                                  const Align(
                                                                                    alignment: AlignmentDirectional(1, 0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 32, 0),
                                                                                      child: Icon(
                                                                                        Icons.chevron_left,
                                                                                        color: Color(0x80FFFFFF),
                                                                                        size: 14,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 150),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 16, 20, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)!
                                                  .getText(
                                                'ccjx0kyq' /* Would you like to support us? */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 0, 16, 32),
                                        child: InkWell(
                                          onTap: () async {
                                            interstitialAdSucces = await admob
                                                .showInterstitialAd();

                                            setState(() {});
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.09,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .background,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(25),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(25),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24, 0, 0, 0),
                                                      child: Icon(
                                                        Icons.favorite_border,
                                                        color:
                                                            Color(0xC0C03A52),
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                24, 0, 24, 0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)!
                                                              .getText(
                                                            'bpp0jcpj' /* When you click on the icon, yo... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 10,
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
                                      ),
                                      const FlutterFlowAdBanner(
                                        width: 320,
                                        height: 100,
                                        showsTestAd: false,
                                        iOSAdUnitID:
                                            'ca-app-pub-5455528914159263/6673061197',
                                        androidAdUnitID:
                                            'ca-app-pub-5455528914159263/4322445623',
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
                    Align(
                      alignment: const AlignmentDirectional(0, 1),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: SmoothPageIndicator(
                          controller: pageViewController1 ??=
                              PageController(initialPage: 0),
                          count: 11,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) {
                            pageViewController1?.animateToPage(
                              i,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          effect: const ExpandingDotsEffect(
                            expansionFactor: 2,
                            spacing: 5,
                            radius: 16,
                            dotWidth: 6,
                            dotHeight: 2,
                            dotColor: Color(0x348B97A2),
                            activeDotColor: Color(0xA58B97A2),
                            paintStyle: PaintingStyle.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 1),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        Utils.assets('images/png.png'),
                      ).image,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CircadiandailywallpWidget(),
                                  ),
                                );
                              },
                              child: const FaIcon(
                                FontAwesomeIcons.circleNotch,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CollectionsWidget(),
                                  ),
                                );
                              },
                              child: const FaIcon(
                                FontAwesomeIcons.solidCircle,
                                color: Color(0xB3FFFFFF),
                                size: 22,
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
                              child: const Icon(
                                Icons.animation,
                                color: Color(0xB2FFFFFF),
                                size: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: _showBackToTopButton == false
            ? null
            : FloatingActionButton(
                onPressed: _scrollToTop,
                backgroundColor: const Color(0x34D81B60),
                child: const Icon(
                  Icons.arrow_upward_sharp,
                  color: Color(0x34CC36B9),
                  size: 24,
                ),
              ));
  }
}
