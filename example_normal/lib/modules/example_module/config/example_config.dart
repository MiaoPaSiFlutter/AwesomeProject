/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-19 09:14:44
 * @LastEditors: TT
 * @LastEditTime: 2023-05-16 17:18:40
 */

import 'package:animation_demo/animation_demo.dart';
import 'package:canvas_demo/canvas_demo.dart';
import 'package:common_demo/common_demo.dart';
import 'package:flutter_black_hole/flutter_black_hole.dart';
import 'package:flutter_books/flutter_books.dart';
import 'package:flutter_chatgpt_app/flutter_chatgpt_app.dart';
import 'package:flutter_crypto_market_app/flutter_crypto_market_app.dart';
import 'package:flutter_fitness_app/flutter_fitness_app.dart';
import 'package:flutter_foodhub_app/flutter_foodhub_app.dart';
import 'package:flutter_jd/flutter_jd.dart';
import 'package:extended_sliver_demo/extended_sliver_demo.dart';
import 'package:flutter_marketky_app/flutter_marketky_app.dart';
import 'package:flutter_mitchkoko/flutter_mitchkoko.dart';
import 'package:flutter_muet_attendance_taking_app/flutter_muet_attendance_taking_app.dart';
import 'package:flutter_nimbus_app/flutter_nimbus_app.dart';
import 'package:flutter_oorbswallpaper_app/flutter_oorbswallpaper_app.dart';
import 'package:flutter_paytabs_tickets_app/flutter_paytabs_tickets_app.dart';
import 'package:flutter_periodic_table_app/flutter_periodic_table_app.dart';
import 'package:flutter_to_do_app/flutter_to_do_app.dart';
import 'package:flutter_weather/flutter_weather.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:scrollerview_demo/scrollerview_demo.dart';
import 'example_launch_id_config.dart';
import '../models/image_type_model.dart';
import '../routers/example_module_routers.dart';

class ExamplConfig {
  List examplePageList = [
    /// 抽屉模块
    ExampleModuleRouterS.drawerExample,
  ];

  List itemList = [
    HzyNormalItemModel(
      leftMsg:
          "ChatGPT 🤖 是一款基于 Flutter 的移动应用程序，带来了强大的 AI 聊天功能。  它提供了增强的移动 UI/UX、建议问题列表、可自定义的聊天主题、多个聊天主题、启动屏幕、更改 ChatGPT AI 模型的能力以及在主屏幕上添加的 Rive 动画。",
      router: ChatGPTAppModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "京东",
      router: JingDongModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "书城",
      router: BooksModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "天气",
      router: WeatherModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "Flutter 精美 UI 截图",
      router: MitchkokoModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一款开源的音乐播放器应用程序！",
      router: BlackHoleModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "通过手机记录学生的出勤情况，并生成文本或图像形式的报告",
      router: MuetAttendanceTakingModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一个美食中心APP",
      router: FoodHubAppModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一个在线售卖门票的APP - api已不可用",
      router: PaytabsTicketsModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一个壁纸的APP",
      router: OorbsWallpaperModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一个个人博客类UI的 WEB & APP",
      router: NimbusAppModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一款健身应用的UI模板APP",
      router: FitnessAppModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一款元素周期表及元素3D模型的APP",
      router: PeriodicTableAppModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一款计划｜待办事项的UI模板APP",
      router: ToDoAppModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一个商城类的UI界面的APP",
      router: MarketkyAppModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: '''一个显示有关加密货币硬币的实时数据和详细信息的APP''',
      router: CryptoMarketAppModuleRouterS.HOME,
    ),

    HzyNormalItemModel(
      leftMsg: "extended_sliver_demo",
      router: ExtendedSliverModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "scrollerview_demo",
      router: ScrollerDemoModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "animation_demo",
      router: AnimationDemoModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "canvas_demo",
      router: CanvasDemoModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "common_demo",
      router: CommonDemoModuleRouterS.HOME,
    ),

    /// 抽象类基础属性展示
    HzyNormalItemModel(
      leftMsg: "基类属性",
      router: ExampleModuleRouterS.basicMarkdown,
    ),

    HzyNormalItemModel(
      leftMsg: "基类使用",
      router: ExampleModuleRouterS.basic,
    ),

    HzyNormalItemModel(
      leftMsg: "TabBar",
      router: ExampleModuleRouterS.basicTabbar,
    ),
    HzyNormalItemModel(
      leftMsg: ExampleLaunchIdConfig.drawer.tr,
      router: ExampleModuleRouterS.drawerExample,
    ),

    /// 单元格
    HzyNormalItemModel(
      leftMsg: ExampleLaunchIdConfig.cell.tr,
      router: ExampleModuleRouterS.cells,
    ),

    /// 图格
    HzyNormalItemModel(
      leftMsg: ExampleLaunchIdConfig.imageGrid.tr,
      router: ExampleModuleRouterS.imageGrid,
    ),

    /// 按钮
    HzyNormalItemModel(
      leftMsg: ExampleLaunchIdConfig.button.tr,
      router: ExampleModuleRouterS.button,
    ),

    /// 组合按钮
    HzyNormalItemModel(
      leftMsg: ExampleLaunchIdConfig.combinationBtn.tr,
      router: ExampleModuleRouterS.comButton,
    ),

    /// 模态对话框
    HzyNormalItemModel(
      leftMsg: "MarkDown",
      router: ExampleModuleRouterS.markdown,
    ),

    HzyNormalItemModel(
      leftMsg: ExampleLaunchIdConfig.modalDialog.tr,
      router: ExampleModuleRouterS.modaldialog,
    ),

    /// 按钮
  ];

  List<ImageTypeModel> typeList = [
    ImageTypeModel(title: "美女", type: "beauty"),
    ImageTypeModel(title: "人物", type: "person"),
    ImageTypeModel(title: "漫画", type: "comic"),
    ImageTypeModel(title: "游戏", type: "game"),
    ImageTypeModel(title: "电影", type: "movie"),
    ImageTypeModel(title: "风景", type: "scenery"),
  ];

  List<String> typeStrList = [
    "beauty",
    "person",
    "comic",
    "game",
    "movie",
    "scenery"
  ];

  List<Map> normalData = [
    {
      "id": 11950,
      "title": "女孩 兽耳 狐狸 尾巴 厚",
      "url":
          "https://pic.netbian.com/uploads/allimg/220111/002720-16418320408c00.jpg",
      "type": "comic"
    },
    {
      "id": 11951,
      "title": "原神 刻晴 黑丝袜子 船 ",
      "url":
          "https://pic.netbian.com/uploads/allimg/220111/002342-1641831822d19e.jpg",
      "type": "comic"
    },
    {
      "id": 11952,
      "title": "碧蓝航线 黑裤袜 黑丝袜",
      "url":
          "https://pic.netbian.com/uploads/allimg/220110/000951-164174459132f1.jpg",
      "type": "comic"
    },
    {
      "id": 11953,
      "title": "天空小姐姐 黑色唯美裙子",
      "url":
          "https://pic.netbian.com/uploads/allimg/210812/234309-1628782989eba1.jpg",
      "type": "comic"
    },
    {
      "id": 11954,
      "title": "下午 趴在桌子的女孩4k动",
      "url":
          "https://pic.netbian.com/uploads/allimg/190824/212516-15666531161ade.jpg",
      "type": "comic"
    },
    {
      "id": 11955,
      "title": "长发少女黑色吊带裙 好看",
      "url":
          "https://pic.netbian.com/uploads/allimg/200618/005100-1592412660d6f4.jpg",
      "type": "comic"
    },
    {
      "id": 11956,
      "title": "猫羽雫 蓝色眼睛女子 尾",
      "url":
          "https://pic.netbian.com/uploads/allimg/210317/001935-1615911575642b.jpg",
      "type": "comic"
    },
    {
      "id": 11957,
      "title": "赛博朋克风格奇幻少女 集",
      "url":
          "https://pic.netbian.com/uploads/allimg/210423/224716-1619189236e4d9.jpg",
      "type": "comic"
    },
    {
      "id": 11958,
      "title": "3D女孩 辫子 绿色 荧光4",
      "url":
          "https://pic.netbian.com/uploads/allimg/220107/233004-1641569404ec45.jpg",
      "type": "comic"
    },
    {
      "id": 11959,
      "title": "江南烧酒4k动漫壁纸",
      "url":
          "https://pic.netbian.com/uploads/allimg/180803/084010-15332568107994.jpg",
      "type": "comic"
    }
  ];
}
