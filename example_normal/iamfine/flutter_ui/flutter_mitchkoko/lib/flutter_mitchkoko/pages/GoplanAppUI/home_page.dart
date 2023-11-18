import 'package:flutter/material.dart';

import 'common/common_imdex.dart';
import 'pages/widgets/header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class PieData {
  PieData(this.activity, this.time);
  String activity;
  double time;
}

class _HomePageState extends State<HomePage> {
  double _headerHeight = 150;
  Key _formKey = GlobalKey<FormState>();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: _headerHeight,
            child: HeaderWidget(_headerHeight, true, Icons.person),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: const EdgeInsets.fromLTRB(
                  20, 10, 20, 10), // This will be the login form
              child: Column(children: [
                const Text(
                  'Homepage',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  '',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 0.0),
                Form(
                  key: _formKey,
                  child: Column(children: [
                    Container(
                      decoration: ThemeHelper().inputBoxDecorationShaddow(),
                      child: TextField(
                        decoration: ThemeHelper().textInputDecoration('search'),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const SizedBox(height: 15.0),
                  ]),
                ),
              ]),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge_rounded),
            label: 'Business',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
