import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_paytabs_tickets_app/flutter_paytabs_tickets_app.dart';

class TicketApp extends ConsumerWidget {
  const TicketApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      onGenerateRoute: AppRouter.getRoute,
      initialRoute: RouterNames.mainRoute,
      title: 'Ticket App',
      theme: ref.theme,
    );
  }
}
