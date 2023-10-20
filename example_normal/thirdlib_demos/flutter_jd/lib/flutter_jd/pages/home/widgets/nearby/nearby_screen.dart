import 'package:flutter/material.dart';

class NearbyScreen extends StatefulWidget {
  const NearbyScreen({Key? key}) : super(key: key);

  @override
  State createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('附近'),
      ),
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: ListView.builder(
          shrinkWrap: true, //解决无限高度问题
          padding: const EdgeInsets.all(0),
          itemCount: 100,
          itemBuilder: _pageItemBuilder,
        ),
      ),
    );
  }

  Widget _pageItemBuilder(context, index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text("data $index"),
    );
  }
}
