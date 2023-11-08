import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_paytabs_tickets_app/flutter_paytabs_tickets_app.dart';

import 'ticket_app.dart';

class PaytabsTicketsApp extends StatefulWidget {
  const PaytabsTicketsApp({super.key});

  @override
  State<PaytabsTicketsApp> createState() => _PaytabsTicketsAppState();
}

class _PaytabsTicketsAppState extends State<PaytabsTicketsApp> {
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
