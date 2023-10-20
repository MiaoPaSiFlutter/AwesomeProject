import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';
import '../vm/home_viewmodel.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({Key? key}) : super(key: key);

  @override
  State createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, homeProvider, child) {
        String? topBgImgBig;
        if (homeProvider.welcomeHomeData.containsKey("topBgImgBig")) {
          topBgImgBig = homeProvider.welcomeHomeData["topBgImgBig"];
        }
        return Positioned(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.red, width: 3),
              image: DecorationImage(
                image: ExtendedNetworkImageProvider(
                    HyzyTextTools.mpsfStr(topBgImgBig)),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(height: MediaQuery.of(context).padding.top),
                    _getNavigationView(context),
                    _getSearchView(context),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _getNavigationView(BuildContext context) {
    String calanderUrl =
        "https://m.360buyimg.com/mobilecms/jfs/t1/196128/5/18710/2805/611b6dd0Ec500522a/4a07abb7e0504777.png!q70.jpg";
    return SizedBox(
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 1),
              ),
              child: const JdCommonLocationView(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: CommonExtendedImageWidget.netWorkImget(
                    url: calanderUrl, height: 25),
                onPressed: () {},
              ),
              IconButton(
                icon: CommonExtendedImageWidget.netWorkImget(
                    url: calanderUrl, height: 25),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getSearchView(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: const Icon(Icons.safety_check,
                            color: Colors.grey, size: 15),
                        onPressed: () {}),
                    const Text("菜种子家庭种植", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
            IconButton(
              padding: const EdgeInsets.all(0),
              icon: const Icon(
                Icons.camera,
                color: Colors.grey,
                size: 20,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
