import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class NFTappuiUI extends StatelessWidget {
  const NFTappuiUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.lime),
    );
  }
}
