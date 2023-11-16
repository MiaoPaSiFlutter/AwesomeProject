import 'package:flutter/material.dart';
import '../screens/main_screen.dart';
import '../helper/helper_index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void splashScreenFunction() async {
    await Future.delayed(const Duration(seconds: 5));
    if (context.mounted) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const MainScreen();
        },
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    splashScreenFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
            height: 18.55,
            width: 112.0,
            child: Image.asset(Utils.assets('images/logo_white.png'))),
      ),
    );
  }
}
