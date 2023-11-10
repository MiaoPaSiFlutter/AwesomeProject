import 'package:flutter/material.dart';
import '../../helper/helper_index.dart';
import '../../pages/friends_page.dart';
import '../../pages/market_page.dart';
import '../../pages/message_page.dart';
import '../../pages/profile_page.dart';
import '../../pages/video_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            child: DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Text(
                    'Menu',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: IconButton(
                        icon: const Icon(Icons.search),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          print('Search Clicked');
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    backgroundImage:
                        Image.asset(Utils.assets('images/user/sonam.jpg'))
                            .image,
                  ),
                  title: const Text(
                    'Sonam Sharma',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('View your Profile'),
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    ),
                  },
                ),
                const Divider(thickness: 1, color: Colors.black12),
                ListTile(
                  leading: const Icon(
                    Icons.coronavirus_rounded,
                    color: Colors.red,
                  ),
                  title: const Text(
                    'Covid-19 Information Center',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () => {print('Covid Icon Tapped')},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.message,
                    color: Colors.green,
                  ),
                  title: const Text(
                    'Messages',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () => {
                    // print('message tapped 1'),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Material(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 20.0),
                            child: MessagePage(),
                          ),
                        ),
                      ),
                    ),
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.group,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'Groups',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () => {print('Group Tapped')},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.shopping_bag,
                    color: Colors.blueAccent,
                  ),
                  title: const Text(
                    'Marketplace',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () => {
                    // print('Marketplace Tapped'),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Material(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 20.0),
                            child: MarketPage(),
                          ),
                        ),
                      ),
                    ),
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.people,
                    color: Colors.green,
                  ),
                  title: const Text(
                    'Friends',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () => {
                    // print('Friends Tapped'),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Material(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 20.0),
                            child: FriendsPage(),
                          ),
                        ),
                      ),
                    ),
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.video_label,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'Videos',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () => {
                    // print('Videos Tapped'),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Material(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 20.0),
                            child: VideoPage(),
                          ),
                        ),
                      ),
                    ),
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.pages,
                    color: Colors.red,
                  ),
                  title: const Text(
                    'Pages',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () => {print('Pages Tapped')},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                  title: const Text(
                    'Settings',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () => {print('Settings Tapped')},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.privacy_tip,
                    color: Colors.blueGrey,
                  ),
                  title: const Text(
                    'Privacy Policy',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () => {print('Privacy Policy Tapped')},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.help,
                    color: Colors.grey,
                  ),
                  title: const Text(
                    'Help Center',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () => {print('Help Center Tapped')},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.book,
                    color: Colors.grey,
                  ),
                  title: const Text(
                    'About',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () => {print('About Tapped')},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () => {print('Logout Tapped')},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
