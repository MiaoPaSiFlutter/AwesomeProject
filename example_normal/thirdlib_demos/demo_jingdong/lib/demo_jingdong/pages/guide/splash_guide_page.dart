import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/reject.dart';
import 'widgets/pageIndicator.dart';
import 'provider/indexNotifier.dart';
import 'provider/offsetNotifier.dart';

class SplashGuidePage extends StatefulWidget {
  const SplashGuidePage({Key? key}) : super(key: key);

  @override
  State createState() => _SplashGuidePageState();
}

class _SplashGuidePageState extends State<SplashGuidePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: ChangeNotifierProvider(
        create: (context) => IndexNotifier(),
        child: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController? _pageController;
  OffsetNotifier? _notifier;
  @override
  void initState() {
    _pageController = PageController(
        initialPage: Provider.of<IndexNotifier>(context, listen: false).index);
    _notifier = OffsetNotifier(_pageController!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _notifier,
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        body: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).padding.top),
            _getAppBar(),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int index) {
                  Provider.of<IndexNotifier>(context, listen: false).index =
                      index;
                },
                children: const <Widget>[
                  Reject(index: 0),
                  Reject(index: 1),
                  Reject(index: 2),
                  Reject(index: 3),
                  Reject(index: 4),
                ],
              ),
            ),
            _getBottomIndicator(),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }

  Widget _getAppBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            "Hops",
            style: TextStyle(
              fontSize: 22,
              fontFamily: "Graphik",
              fontWeight: FontWeight.w800,
            ),
          ),
          Stack(
            children: <Widget>[
              const IconButton(icon: Icon(Icons.safety_check), onPressed: null),
              Positioned(
                right: 10,
                bottom: 8,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getBottomIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const PageIndicator(),
        InkWell(
          child: const Text(
            "View Board",
            style: TextStyle(
              fontFamily: "Graphik",
              fontWeight: FontWeight.w400,
              letterSpacing: 3,
            ),
          ),
          onTap: () {
            // NavigatorUtil.push(context, LoginRouter.loginPage, replace: true);
          },
        ),
        const Padding(
          padding: EdgeInsets.only(right: 0),
          child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 11,
              ),
              onPressed: null),
        ),
      ],
    );
  }
}
