import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_paytabs_tickets_app/flutter_paytabs_tickets_app.dart';
import 'package:flutter_paytabs_tickets_app/flutter_paytabs_tickets_app/pages/event_details/event_details_screen.dart';
import 'package:flutter_paytabs_tickets_app/flutter_paytabs_tickets_app/pages/main/main_screen.dart';
import 'package:flutter_paytabs_tickets_app/flutter_paytabs_tickets_app/pages/payment/payment_screen.dart';

class AppRouter {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterNames.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case RouterNames.eventDetailsRoute:
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ));
        return MaterialPageRoute(
          builder: (_) => EventDetailsScreen(
            event: settings.arguments as Event,
          ),
        );
      case RouterNames.eventDetailsRoute:
        return MaterialPageRoute(
            builder: (_) =>
                EventDetailsScreen(event: settings.arguments as Event));
      case RouterNames.paymentRoute:
        return MaterialPageRoute(
            builder: (_) => PaymentScreen(event: settings.arguments as Event));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('noRouteFound')),
        body: const Center(child: Text('noRouteFound')),
      ),
    );
  }
}
