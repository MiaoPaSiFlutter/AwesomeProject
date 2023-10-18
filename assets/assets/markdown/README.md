<!--
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-10 14:14:09
 * @LastEditors: TT
 * @LastEditTime: 2023-05-11 17:10:13
-->
# 一看就停不下来

## 目录
- 项目架构
![p](/assets/markdown/p_tree.png)
- 模块架构
![m](/assets/markdown/m_tree.png)
- 事例模块
![e](/assets/markdown/e_tree.png)

  > 以上基本完成了我们项目的搭建。
      为了以后把模块抽离主工程。
      以**Package**引入时，
      不需要做太多的修改。
      所以我们在创建`模块`的时候，
      已经完成符合了我们`模块架构`要求.
## 界面关系网

 ![p](/assets/markdown/basic_ms.jpeg)
## 开发规范

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

## 代码事例
```dart
  @override
  Widget createBody({BoxConstraints? constraints}) {
        Widget body = Container();
        body = Markdown(data: controller.data);
        return body;
  }
```