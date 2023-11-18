import 'package:flutter/material.dart';

import '../../../helper/helper_index.dart';
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
              iconSrc: Utils.assets("images/facebook.svg"),
              press: () {},
            ),
            SocalIcon(
              iconSrc: Utils.assets("images/twitter.svg"),
              press: () {},
            ),
            SocalIcon(
              iconSrc: Utils.assets("images/google-plus.svg"),
              press: () {},
            ),
          ],
        ),
      ],
    );
  }
}
