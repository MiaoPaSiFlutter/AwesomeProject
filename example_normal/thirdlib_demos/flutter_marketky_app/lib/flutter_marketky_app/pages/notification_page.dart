import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../compontents/compontents_index.dart';
import '../constant/constant_index.dart';
import '../models/models_index.dart';
import '../services/services_index.dart';
import '../tools/tools_index.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<UserNotification> listNotification =
      NotificationService.listNotification;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        cartValue: 2,
        chatValue: 2,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Menu
          MenuTileWidget(
            onTap: () {},
            icon: SvgPicture.asset(
              Utils.assets('icons/Discount.svg'),
              color: AppColor.secondary.withOpacity(0.5),
            ),
            title: 'Product Promo',
            subtitle: 'Lorem ipsum Dolor sit Amet',
          ),
          MenuTileWidget(
            onTap: () {},
            icon: SvgPicture.asset(
              Utils.assets('icons/Info Square.svg'),
              color: AppColor.secondary.withOpacity(0.5),
            ),
            title: 'Marketky Info',
            subtitle: 'Lorem ipsum Dolor sit Amet',
          ),
          // Section 2 - Status ( LIST )
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16, bottom: 8),
                  child: Text(
                    'ORDERS STATUS',
                    style: TextStyle(
                        color: AppColor.secondary.withOpacity(0.5),
                        letterSpacing: 6 / 100,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return NotificationTile(
                      data: listNotification[index],
                      onTap: () {},
                    );
                  },
                  itemCount: listNotification.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
