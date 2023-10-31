import 'package:flutter/material.dart';

import '../components/nft_card.dart';
import '../helper/helper_index.dart';

class TrendingTab extends StatelessWidget {
  const TrendingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NftCard(
      imagePath: Utils.assets("images/apiens_3.png"),
    );
  }
}
