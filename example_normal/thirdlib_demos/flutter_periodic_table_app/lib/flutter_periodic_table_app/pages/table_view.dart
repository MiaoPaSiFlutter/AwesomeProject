import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../compontents/compontents_index.dart';
import '../tools/tools_index.dart';

class TableView extends StatefulWidget {
  const TableView({super.key});

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  List<ElementClass> elements = [];
  void getElements() async {
    final String jsonString =
        await rootBundle.loadString(Utils.assets('json/atoms.json'));
    final List<dynamic> jsonList = json.decode(jsonString)["elements"];

    for (final json in jsonList) {
      final element = ElementClass.fromJson(json as Map<String, dynamic>);
      elements.add(element);
    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getElements();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: const Text("Periodic Table"),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: TableCreator(
              groupCount: 18,
              periodCount: 11,
              elements: elements,
              cellSize: 100,
            ),
          ),
        ),
      ),
    );
  }
}
