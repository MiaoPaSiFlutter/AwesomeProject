import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/auth_page.dart';

class EmailLoginLogoutUI extends StatefulWidget {
  const EmailLoginLogoutUI({super.key});

  @override
  State<EmailLoginLogoutUI> createState() => _EmailLoginLogoutUIState();
}

class _EmailLoginLogoutUIState extends State<EmailLoginLogoutUI> {
  bool _isInitializeApp = false;
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((value) {
      setState(() {
        _isInitializeApp = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _isInitializeApp
          ? const AuthPage()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
