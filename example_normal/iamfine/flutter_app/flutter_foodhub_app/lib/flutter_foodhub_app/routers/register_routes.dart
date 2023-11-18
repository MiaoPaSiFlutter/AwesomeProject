import 'package:flutter/widgets.dart';
import 'package:flutter_foodhub_app/flutter_foodhub_app/pages/screens/home/home_screen.dart';
import 'package:flutter_foodhub_app/flutter_foodhub_app/pages/screens/home/search_screen.dart';
import 'package:flutter_foodhub_app/flutter_foodhub_app/pages/screens/login/login_screen.dart';
import 'package:flutter_foodhub_app/flutter_foodhub_app/pages/screens/profile/profile_screen.dart';
import 'package:flutter_foodhub_app/flutter_foodhub_app/pages/screens/register/register_screen.dart';
import 'package:flutter_foodhub_app/flutter_foodhub_app/pages/screens/restaurant_detail/restaurant_detail_screen.dart';
import 'package:flutter_foodhub_app/flutter_foodhub_app/pages/screens/restaurant_favorite/restaurant_favorite_screen.dart';
import 'package:flutter_foodhub_app/flutter_foodhub_app/pages/screens/restaurant_review/restaurant_review_screen.dart';
import 'package:flutter_foodhub_app/flutter_foodhub_app/pages/screens/splashscreen/splash_screen.dart';
import 'package:flutter_foodhub_app/flutter_foodhub_app/pages/screens/welcome/welcome_screen.dart';

import 'routes.dart';

Map<String, WidgetBuilder> routesApp = {
  Routes.splashScreen: (_) => SplashScreen(),
  Routes.welcomeScreen: (_) => const WelcomeScreen(),
  Routes.loginScreen: (_) => const LoginScreen(),
  Routes.registerScreen: (_) => const RegisterScreen(),
  Routes.homeScreen: (_) => const HomeScreen(),
  Routes.restaurantDetailScreen: (_) => RestaurantDetailScreen(
        id: ModalRoute.of(_)!.settings.arguments as String,
      ),
  Routes.restaurantSearchScreen: (_) => SearchScreen(
        query: ModalRoute.of(_)!.settings.arguments as String,
      ),
  Routes.restaurantReviewScreen: (_) => RestaurantReviewScreen(
        id: ModalRoute.of(_)!.settings.arguments as String,
      ),
  Routes.restaurantFavoriteScreen: (_) => const RestaurantFavoriteScreen(),
  Routes.profileScreen: (_) => const ProfileScreen(),
};
