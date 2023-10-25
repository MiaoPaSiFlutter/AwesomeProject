import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../../screens/Signup/components/or_divider.dart';
import '../../../screens/Signup/components/social_icon.dart';

class SocalSignUp extends StatelessWidget {
  const SocalSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SocalIcon(
              iconSrc: NormalModuleUtils.configPackagesImage(
                  packagename: "flutter_mitchkoko",
                  name:
                      "assets/ResponsiveWelcomeLoginAndSignUpUI/images/facebook.svg"),
              press: () {},
            ),
            SocalIcon(
              iconSrc: NormalModuleUtils.configPackagesImage(
                  packagename: "flutter_mitchkoko",
                  name:
                      "assets/ResponsiveWelcomeLoginAndSignUpUI/images/twitter.svg"),
              press: () {},
            ),
            SocalIcon(
              iconSrc: NormalModuleUtils.configPackagesImage(
                  packagename: "flutter_mitchkoko",
                  name:
                      "assets/ResponsiveWelcomeLoginAndSignUpUI/images/google-plus.svg"),
              press: () {},
            ),
          ],
        ),
      ],
    );
  }
}
