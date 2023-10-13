/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-19 20:37:17
 * @LastEditors: TT
 * @LastEditTime: 2023-09-07 17:32:41
 */
library hzy_common_module;

export 'utils/utils_index.dart';
export 'config/config_index.dart';
export 'components/components_index.dart';
export 'models/models_index.dart';

// 框架基础
export 'package:get/get.dart' hide Response, MultipartFile, FormData;
// 适配屏幕
export 'package:flutter_screenutil/flutter_screenutil.dart';
// app 隐私权限
export 'package:permission_handler/permission_handler.dart';
// 加载动画
export 'package:flutter_easyloading/flutter_easyloading.dart';
// 本地存储
export 'package:shared_preferences/shared_preferences.dart';
/**
 * 框架基础工具
 * 1. 抽象类
 *    hzy_normal_abstract_widget Widget 抽象类
 *    hzy_normal_abstracts  通用抽象类
 *    hzy_normal_theme_abstract 主题抽象类
 * 2. 界面基类
 *    hzy_base_list_state 列表页基类
 *    hzy_base_state state基类
 * 3. 配置文件
 *    hzy_normal_colors 颜色配置文件
 *    hzy_text_style 字体样式配置文件
 * 4. 通用工具
 * 5. 通用UI
 * */

export 'package:hzy_normal_tool/hzy_normal_tool.dart';
// 网络请求
export 'package:hzy_normal_network/hzy_normal_network.dart' hide MultipartFile;
// 图片工具
export 'package:extended_image/extended_image.dart' hide DoubleExtension;

export 'package:extended_image_library/extended_image_library.dart';

// 相册选择
export 'package:image_picker/image_picker.dart';
export 'package:wechat_assets_picker/wechat_assets_picker.dart'
    hide NotifyManager;
export 'package:wechat_camera_picker/wechat_camera_picker.dart'
    hide NotifyManager;
