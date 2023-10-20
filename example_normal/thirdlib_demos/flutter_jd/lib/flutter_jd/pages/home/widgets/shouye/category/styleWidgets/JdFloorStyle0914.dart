// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class JdFloorStyle0914 extends StatelessWidget {
  final Map? floor;
  const JdFloorStyle0914({Key? key, this.floor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String style = floor?["style"] ?? "";
    String floorName = floor?["floorName"] ?? "";
    String rightImg = floor?["rightImg"] ?? "";
    String rightText = floor?["rightText"] ?? "";
    List content = floor?["content"];
    return Container(
      // height: 100,
      padding: const EdgeInsets.all(0),
      color: Colors.black12,
      child: GridView.builder(
        padding: const EdgeInsets.all(0),

        ///Container跟随GridView内容变化高度, shrinkWrap:true;
        shrinkWrap: true,

        ///取消滚动效果physics: NeverScrollableScrollPhysics();
        physics: const NeverScrollableScrollPhysics(),
        itemCount: content.length,

        ///SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

            ///横轴元素个数
            crossAxisCount: 5,

            ///纵轴间距
            mainAxisSpacing: 0,

            ///横轴间距
            crossAxisSpacing: 0,

            ///子组件宽高长度比例
            childAspectRatio: 0.75),
        itemBuilder: (BuildContext context, int position) {
          return _createGridViewItem(context, position); //布局样式自己定义
        },
      ),
    );
  }

  Widget _createGridViewItem(BuildContext context, int position) {
    List content = floor?["content"] ?? [];
    String img = content[position]["img"] ?? "";
    String title = content[position]?["title"] ?? "";

    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(img),
        ));
      },
      child: Container(
        decoration: const BoxDecoration(
          // border: Border.all(width: 1, color: Colors.green),
          color: Colors.white,
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  heightFactor: 0.8,
                  child: CommonExtendedImageWidget.netWorkImget(url: img),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            )
          ],
          // child: CommonNetworkImage(img, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
