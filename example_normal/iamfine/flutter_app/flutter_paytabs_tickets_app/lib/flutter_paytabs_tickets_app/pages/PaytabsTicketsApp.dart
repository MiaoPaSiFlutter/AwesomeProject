import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_paytabs_tickets_app/flutter_paytabs_tickets_app.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'ticket_app.dart';

class PaytabsTicketsApp extends GetView<PaytabsTicketsAppController> {
  const PaytabsTicketsApp({super.key});

  @override
  PaytabsTicketsAppController get controller =>
      Get.put(PaytabsTicketsAppController());

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class PaytabsTicketsAppController extends GetxController {
  PaytabsTicketsAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _init = false;

  @override
  void initState() {
    super.initState();
    main();
  }

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    DioHelper.init();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    setState(() {
      _init = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _init
        ? const ProviderScope(child: TicketApp())
        : const Center(
            child: Text('准备中。。。'),
          );
  }
}
