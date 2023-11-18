import 'package:flutter/material.dart';

import '../components/nft_card.dart';
import '../helper/helper_index.dart';

class RecentTab extends StatelessWidget {
  const RecentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NftCard(
      imagePath: Utils.assets("images/apiens_1.png"),
    );
  }
}
