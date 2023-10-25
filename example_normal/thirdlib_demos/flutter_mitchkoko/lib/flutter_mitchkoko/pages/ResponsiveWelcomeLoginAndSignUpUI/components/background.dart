import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    this.topImage,
    this.bottomImage,
  }) : super(key: key);

  final String? topImage, bottomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                topImage ??
                    NormalModuleUtils.configPackagesImage(
                        packagename: "flutter_mitchkoko",
                        name:
                            "assets/ResponsiveWelcomeLoginAndSignUpUI/images/main_top.png"),
                width: 120,
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   right: 0,
            //   child: Image.asset(
            //       bottomImage ??
            //           NormalModuleUtils.configPackagesImage(
            //               packagename: "flutter_mitchkoko",
            //               name:
            //                   "assets/ResponsiveWelcomeLoginAndSignUpUI/images/login_bottom.png"),
            //       width: 120),
            // ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
