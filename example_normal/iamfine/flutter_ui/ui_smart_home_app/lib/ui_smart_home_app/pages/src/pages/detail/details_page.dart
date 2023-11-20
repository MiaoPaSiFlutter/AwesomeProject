import 'package:flutter/material.dart';

import 'compontents/Header.dart';
import 'compontents/Scheule.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool positive = false;
  bool loading = false;

  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Scheule(),
          ],
        ),
      ),
    );
  }
}
