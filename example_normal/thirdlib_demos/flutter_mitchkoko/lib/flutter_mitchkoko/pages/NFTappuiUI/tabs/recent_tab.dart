import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../components/nft_card.dart';

class RecentTab extends StatelessWidget {
  const RecentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NftCard(
      imagePath: NormalModuleUtils.configPackagesImage(
          packagename: "flutter_mitchkoko",
          name: "assets/NFTappuiUI/images/apiens_1.png"),
    );
  }
}
