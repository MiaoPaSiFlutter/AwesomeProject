import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../../constants/constants_index.dart';
import '../../provider/provider_index.dart';

class QuickByWidget extends StatelessWidget {
  const QuickByWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<APIServiceProvider>(builder: (context, snapshot, _) {
      return SizedBox(
          height: MediaQuery.of(context).size.height / 7.5,
          child: snapshot.isLoad || snapshot.cryptoCoinsList.isEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 20, bottom: 8.0),
                      child: Shimmer.fromColors(
                        baseColor: AppColors.white,
                        highlightColor: AppColors.primary100,
                        child: Container(
                          height: 200,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.white),
                        ),
                      ),
                    );
                  })
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 13, bottom: 8.0, left: 5.0),
                      child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3.0, color: AppColors.primary)
                              ],
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.white),
                          child: SizedBox(
                            width: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: CircleAvatar(
                                backgroundColor: AppColors.grey,
                                backgroundImage: NetworkImage(snapshot
                                    .cryptoCoinsList[i].image
                                    .toString()),
                              ),
                            ),
                          )),
                    );
                  }));
    });
  }
}
