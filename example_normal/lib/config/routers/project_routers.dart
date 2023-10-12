/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-09 22:21:33
 * @LastEditors: TT
 * @LastEditTime: 2023-05-11 11:03:03
 */
/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-09 22:21:33
 * @LastEditors: TT
 * @LastEditTime: 2023-04-09 22:21:33
 */

import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:example_normal/pages/root_pages/root_v.dart';
import '../dataconfig/page_id_config.dart';

class ProjectPageS {
  static final routers = [
    GetPage(
      name: PageIdConfig.index,
      page: () => RootV(),
    )
  ];
}
