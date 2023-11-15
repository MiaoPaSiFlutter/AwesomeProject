import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../helper/helper_index.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SizedBox(
          width: 106.w,
          height: 137.h,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset(Utils.assets('images/Logo.png')),
          ),
        ),
      ),
    );
  }
}
