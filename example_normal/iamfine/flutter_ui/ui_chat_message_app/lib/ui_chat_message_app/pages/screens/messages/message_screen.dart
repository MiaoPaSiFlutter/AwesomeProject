import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../helper/helper_index.dart';
import 'components/body.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage(Utils.assets("images/user_2.png")),
          ),
          const SizedBox(width: kDefaultPadding * 0.75),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kristin Watson', style: TextStyle(fontSize: 16)),
              Text('Active 3m ago', style: TextStyle(fontSize: 12))
            ],
          )
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
        const SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}
