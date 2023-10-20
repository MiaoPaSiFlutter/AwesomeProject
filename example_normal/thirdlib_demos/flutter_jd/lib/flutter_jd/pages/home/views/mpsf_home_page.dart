import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/shouye/JdShouYeScreen.dart';

class MpsfHomePage extends StatefulWidget {
  const MpsfHomePage({Key? key}) : super(key: key);

  @override
  State createState() => _MpsfHomePageState();
}

class _MpsfHomePageState extends State<MpsfHomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  late StreamSubscription updateAppEvent;

  @override
  void initState() {
    super.initState();
    // updateAppEvent = eventBus.on<UpdateAppEvent>((event) {
    //   JdToastUtil.show("APP可以更新了！！！");
    //   // updateAppDialog.show(context, event);
    // });

    // Future.delayed(const Duration(seconds: 3), () {
    //   eventBus.emit(UpdateAppEvent());
    // });
  }

  @override
  void dispose() {
    // eventBus.off(updateAppEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
        ),
        child: const JdShouYeScreen(),
      ),
    );
  }
}
