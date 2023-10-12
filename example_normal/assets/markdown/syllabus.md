<!--
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-11 09:19:48
 * @LastEditors: TT
 * @LastEditTime: 2023-05-11 11:32:35
-->


# 一看就停不下来

## 目录
- 项目架构
```
.
├── compontents(UI组件文件夹)
│   ├── compontents_index.dart
├── config(项目通用配置文件夹)
│   ├── config_index.dart
│   ├── dataconfig(数据配置项)
│   ├── routers(通用路由配置项)
│   └── transformers(通用网络请求解析器)
├── init(工程初始化文件夹)
│   ├── init.dart(app初始化)
│   ├── init_index.dart
│   └── my_home_page.dart(默认事例DEMO)
├── main.dart
├── modules(模块文件夹)
│   ├── demo_modul(通用模块文件夹)
│   ├── example_module(事例模块)
│   └── my_modul(个人中心模块)
├── pages(主工程依赖界面)
│   ├── home_pages(首页)
│   └── root_pages(根视图)
└── utils(主工程功能文件夹)
    └── utils_index.dart
```
- 模块架构
```
.
├── compontents(模块组件文件夹)
│   └── compontents_index.dart
├── config(模块配置文件夹)
│   └── config_index.dart
├── models(模块模型文件夹)
│   └── models_index.dart
├── module_index.dart(模块对外公开文件目录)
├── network(模块网络请求文件夹)
│   └── network_index.dart
├── pages(模块界面文件夹)
│   └── pages_index.dart
├── routers(模块路由文件夹)
│   ├── module_pages.dart(路由)
│   ├── module_routers.dart(路由别名)
│   └── routers_index.dart
├── tools(模块自有的工具文件夹)
│   └── tools_index.dart
└── vm(抽离层)
    └── vm_index.dart
```
- 事例模块
```

.
├── compontents(组件)
│   ├── compontents.dart(通用组件)
│   ├── compontents_index.dart
│   ├── dart_syntax_highlighter.dart(markdown 代码高亮组题)
│   ├── drawer_compontents.dart(抽屉界面需要的组件)
│   ├── drawer_top_widget.dart(抽屉顶部组件)
│   └── markdow_style.dart（markdown 主题）
├── config(配置项)
│   ├── config_index.dart
│   ├── example_config.dar(单元格配置项)
│   ├── example_en_us_config.dart(多语言英文配置项)
│   ├── example_launch_id_config.dart(多语言ID配置项)
│   └── example_zh_cn_config.dart(多语言中文配置项)
├── models(模型)
│   ├── models_index.dart
│   └── normal_models.dart(事例模块通用模型)
├── module_index.dart(事例模块对外公开目录)
├── network(网络请求文件)
│   └── network_index.dart
├── pages(界面文件夹)
│   ├── example_banner_v.dart(轮播图界面)
│   ├── example_btn_v.dart(按钮界面)
│   ├── example_cells_v.dart(单元格界面)
│   ├── example_com_btn_v.dart(多功能按钮界面)
│   ├── example_drawer_v.dart(抽屉界面)
│   ├── example_home_v.dart(事例首页)
│   ├── example_image_grid_v.dart(图格界面)
│   ├── example_markdown_v.dart(markdown界面)
│   ├── example_modal_dialog_v.dart(模态对话框界面)
│   ├── example_text_anim_v.dart(文字动画化界面)
│   └── pages_index.dart
├── routers()
│   ├── example_module_pages.dart(事例模块路由)
│   ├── example_module_routers.dart(事例模块路由标识)
│   └── routers_index.dart
├── tools(工具)
│   └── tools_index.dart
└── vm(抽离层)
    └── vm_index.dart
```
以上基本完成了我们项目的搭建。
为了以后把模块抽离主工程。以`Package`引入时，不需要做太多的修改。所以我们在创建`模块`的时候，已经完成符合了我们`模块架构`要求.
 
### 开发规范

1. **dart**文件命名规范

    ```
    小驼峰命名规范,如果有多个单词以‘_’分割开
    ```

    **eg**:

    ```
    normal_list_v.dart
    ```

    - **界面**命令规范

        - 基于**state**或**less**
        
                格式:xx_xx_v.dart
                事例:home_v.dart
    
        - 基于**GetVieW**
          
                格式: xx_xx_v.dart
                事例: home_v.dart
    - **组件**命名规范
            
            格式:xx_xx_widget.dart
            事例:common_plate_color_widget.dart
    - **工具**命名规范

            格式: xx_tool.dart
            事例: normal_tool.dart
    - **控制器**命名规范

            格式: xx_xx_c.dart
            事例: home_c.dart
    - **模型**命名规范

            格式: xx_xx_model.dart
            事例: user_model.dart
    - **接口配置**命名规范

            格式: xx_xx_http_config.dart
            事例: normal_http_config.dart
    - **网络请求工具**命名规范

            格式: xx_xx_api_util.dart
            事例: normal_api_util.dart
    - **路由文件**命名规范

            格式: xx_xx_routers.dart
            事例: normal_routers.dart
    - **路由界面**命名规范

            格式: xx_xx_pages.dart
            事例: normal_pages.dart


2. **类名**命名规范

    ```
    大驼峰命名规范 
    ```

    **eg**:

    ```
    NormalPage.dart
    NormalTool.dart
    NormalV.dart
    NormalC.dart
    NormalWidget.dart
    NormalModel.dart
    ```

### 代码事例
```dart
  @override
  Widget createBody({BoxConstraints? constraints}) {
        Widget body = Container();
        body = Markdown(data: controller.data);
        return body;
  }
```