import 'package:flutter/material.dart';

import '../widgets/home/menubar.dart';
import '../widgets/home/post.dart';
import '../widgets/home/postbar.dart';
import '../widgets/home/storybar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: ListView(
        children: const [
          Postbar(),
          Divider(thickness: 1, color: Colors.black12),
          Menubar(),
          Divider(thickness: 1, color: Colors.black12),
          Storybar(),
          Divider(thickness: 1, color: Colors.black12),
          Post(),
        ],
      ),
    );
  }
}
