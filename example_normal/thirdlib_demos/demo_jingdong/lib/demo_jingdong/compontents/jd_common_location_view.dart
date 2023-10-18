import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class JdCommonLocationView extends StatefulWidget {
  const JdCommonLocationView({Key? key}) : super(key: key);

  @override
  State<JdCommonLocationView> createState() => _JdCommonLocationViewState();
}

class _JdCommonLocationViewState extends State<JdCommonLocationView> {
  bool isLocationing = false;
  String? formatted_address = '???';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((mag) {
      dPrint("JdCommonLocationView - 页面渲染完毕");
      getLocationInfo();
    });
  }

  Future<void> getLocationInfo() async {
    setState(() {
      isLocationing = true;
    });

    Map? geoResultData = await AmapManager.startLocationAndGeocode();
    if (geoResultData != null) {
      Map regeocode = geoResultData["regeocode"] ?? {};
      formatted_address = regeocode["formatted_address"] ?? '';
    }

    setState(() {
      isLocationing = false;
    });
  }

  Widget renderAddress1() {
    return const Row(
      children: <Widget>[
        CupertinoActivityIndicator(color: Colors.white),
        Text(
          "定位中...",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget renderAddress2() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.location_searching,
            color: Colors.white,
            size: 15,
          ),
          onPressed: () {},
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              getLocationInfo();
            },
            child: Text(
              "$formatted_address",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLocationing ? renderAddress1() : renderAddress2();
  }
}
