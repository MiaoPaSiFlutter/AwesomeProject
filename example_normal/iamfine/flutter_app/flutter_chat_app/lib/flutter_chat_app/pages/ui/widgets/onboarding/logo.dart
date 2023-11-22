import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../utils/utils.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: isLightTheme(context)
            ? Image.asset(Utils.assets('images/logo_light.png'),
                fit: BoxFit.fill)
            : Image.asset(Utils.assets('images/logo_dark.png'),
                fit: BoxFit.fill));
  }
}
