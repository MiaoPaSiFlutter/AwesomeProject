import 'package:flutter/material.dart';
import 'screens/home/main_home.dart';
import 'screens/login.dart';
import 'screens/product_page.dart';
import 'screens/signup.dart';
import 'screens/splash_screen.dart';
import 'models/models_index.dart';

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
