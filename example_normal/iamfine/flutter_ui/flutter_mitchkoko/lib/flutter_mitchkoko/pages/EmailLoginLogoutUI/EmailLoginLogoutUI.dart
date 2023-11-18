import 'package:flutter/material.dart';
import 'pages/auth_page.dart';

class EmailLoginLogoutUI extends StatefulWidget {
  const EmailLoginLogoutUI({super.key});

  @override
  State<EmailLoginLogoutUI> createState() => _EmailLoginLogoutUIState();
}

class _EmailLoginLogoutUIState extends State<EmailLoginLogoutUI> {
  bool _isInitializeApp = true;
  @override
  void initState() {
    super.initState();
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
