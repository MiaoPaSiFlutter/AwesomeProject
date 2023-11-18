import 'package:flutter/material.dart';
import '../compontents/compontents_index.dart';
import '../constant/constant_index.dart';
import '../models/models_index.dart';
import '../services/services_index.dart';

class FeedsPage extends StatefulWidget {
  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> with TickerProviderStateMixin {
  late TabController tabController;
  List<ExploreItem> listExploreItem = ExploreService.listExploreItem;
  List<ExploreUpdate> listExploreUpdateItem =
      ExploreService.listExploreUpdateItem;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        cartValue: 2,
        chatValue: 2,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          // Tabbbar
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: AppColor.secondary,
            child: TabBar(
              onTap: (index) {
                setState(() {
                  tabController.index = index;
                });
              },
              controller: tabController,
              indicatorColor: AppColor.accent,
              indicatorWeight: 5,
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.w500, fontFamily: 'poppins'),
              unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w400, fontFamily: 'poppins'),
              tabs: const [
                Tab(
                  text: 'Update',
                ),
                Tab(
                  text: 'Explore',
                ),
              ],
            ),
          ),
          // Section 2 - Tab View
          IndexedStack(
            index: tabController.index,
            children: [
              // Tab 1 - Update
              ListView.separated(
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return UpdateCardWidget(
                    data: listExploreUpdateItem[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 24,
                  );
                },
              ),
              // Tab 2 - Explore
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                childAspectRatio: 1 / 1,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(listExploreItem.length, (index) {
                  return ExploreCardWidget(data: listExploreItem[index]);
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
