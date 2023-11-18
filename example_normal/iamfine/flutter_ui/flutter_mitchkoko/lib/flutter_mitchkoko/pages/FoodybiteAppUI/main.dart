import 'package:flutter/material.dart';

import 'routes/router.gr.dart';
import 'theme.dart';

class FoodybiteAppUI extends StatelessWidget {
  const FoodybiteAppUI({super.key});

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();

    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      theme: buildLightTheme(context),
    );
  }
}
