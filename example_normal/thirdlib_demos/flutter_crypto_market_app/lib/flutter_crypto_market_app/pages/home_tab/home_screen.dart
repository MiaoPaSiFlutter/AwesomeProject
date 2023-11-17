import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../../constants/constants_index.dart';
import '../../provider/provider_index.dart';
import 'potfolio_widget.dart';
import 'quick_by_widget.dart';
import 'top_movers_widget.dart';
import 'wtch_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<APIServiceProvider>(context, listen: false).getCryptoData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.grey.shade50,
        toolbarHeight: 50,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.bell,
                color: AppColors.primary,
                size: 29,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleTextWidget("Your Portfolio"),
              const SizedBox(height: 10),
              const PortfolioWidget(),
              const SizedBox(height: 30),
              titleTextWidget("Quick Buy"),
              const SizedBox(height: 5),
              const QuickByWidget(),
              const SizedBox(height: 30),
              titleTextWidget("Watchlist"),
              const SizedBox(height: 5),
              const WatchListWidget(),
              const SizedBox(height: 30),
              titleTextWidget("Top Movers"),
              const SizedBox(height: 5),
              const TopMoversWidget()
            ],
          ),
        ),
      ),
    );
  }

  titleTextWidget(text) {
    return Text(text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18));
  }
}
