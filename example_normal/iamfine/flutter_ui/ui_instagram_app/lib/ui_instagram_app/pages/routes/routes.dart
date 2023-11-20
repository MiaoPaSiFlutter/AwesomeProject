import 'package:hzy_common_module/hzy_common_module.dart';

import '../screens/profile_screen/profile_screen.dart';
import '../screens/screens_handler.dart';

class AppRoutes {
  static List<GetPage> routes = <GetPage>[
    GetPage(
      name: "/instagram_uiredesign",
      page: () => Homepage(),
    ),
    GetPage(
      name: "/instagram_uiredesign/profile",
      page: () => const ProfileScreen(),
    ),
  ];
}
