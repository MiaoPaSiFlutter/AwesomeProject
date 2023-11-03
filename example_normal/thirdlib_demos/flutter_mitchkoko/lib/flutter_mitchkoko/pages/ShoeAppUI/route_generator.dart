import 'package:flutter/material.dart';
import 'package:flutter_mitchkoko/flutter_mitchkoko/pages/ShoeAppUI/screens/home/main_home.dart';
import 'package:flutter_mitchkoko/flutter_mitchkoko/pages/ShoeAppUI/screens/login.dart';
import 'package:flutter_mitchkoko/flutter_mitchkoko/pages/ShoeAppUI/screens/product_page.dart';
import 'package:flutter_mitchkoko/flutter_mitchkoko/pages/ShoeAppUI/screens/signup.dart';
import 'package:flutter_mitchkoko/flutter_mitchkoko/pages/ShoeAppUI/screens/splash_screen.dart';
import 'package:flutter_mitchkoko/flutter_mitchkoko/pages/ShoeAppUI/models/models_index.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args;

    switch (settings.name) {
      case SplashScreen.id:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case LoginScreen.id:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case SignUpScreen.id:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case ProductPage.id:
        args = settings.arguments as Product;
        return MaterialPageRoute(
            builder: (context) => ProductPage(
                  product: args,
                ));

      case UserDashboard.id:
        return MaterialPageRoute(builder: (context) => UserDashboard());

      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
