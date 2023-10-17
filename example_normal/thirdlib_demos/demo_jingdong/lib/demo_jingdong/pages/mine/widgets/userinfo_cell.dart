import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class UserInfoCell extends StatelessWidget {
  final String avatar;
  final String name;
  final String displayName;

  const UserInfoCell({
    Key? key,
    this.avatar = "https://user-gold-cdn.xitu.io/2019/12/21/16f279cc3b91f5e9",
    this.name = "多福多寿",
    this.displayName = "东方饭店",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CommonExtendedImageWidget.netWorkImget(url: avatar),
          ),
          const Padding(padding: EdgeInsets.only(left: 15)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(name,
                    style: const TextStyle(
                        fontSize: 18, color: Color(0xFF333333))),
                Text(displayName,
                    style: const TextStyle(
                        fontSize: 13, color: Color(0xFF999999))),
                const Padding(padding: EdgeInsets.only(top: 2)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 10),
        ],
      ),
    );
  }
}
