import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class MineUserinfoCell extends StatefulWidget {
  final Map? floor;

  const MineUserinfoCell({Key? key, this.floor}) : super(key: key);

  @override
  State createState() => _MineUserinfoCellState();
}

class _MineUserinfoCellState extends State<MineUserinfoCell> {
  String? _bgImg;
  String? _avatar;
  String? _title;
  String? _displayName;
  String? _newPlusBlackCardbgImage;

  @override
  void initState() {
    super.initState();
    // _bgImg = widget.floor?["data"]?["bgImgInfo"]?["bgImg"];
    _bgImg = 'https://t7.baidu.com/it/u=1819248061,230866778&fm=193&f=GIF';
    _avatar = widget.floor?["data"]?["userInfoSns"]?["imgUrl"];
    _title = widget.floor?["data"]?["userInfoSns"]?["title"];
    _displayName = widget.floor?["data"]?["userInfoSns"]?["title"];
    _newPlusBlackCardbgImage =
        widget.floor?["data"]?["newPlusBlackCard"]?["bgImage"];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 44),
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.transparent),
        image: DecorationImage(
          image: ExtendedNetworkImageProvider(_bgImg ?? ''),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          _creatUserInfoSnsView(context),
          _creatNewPlusBlackCardView(context),
        ],
      ),
    );
  }

  ///基础信息
  Widget _creatUserInfoSnsView(BuildContext context) {
    TextStyle titleStyle = const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF333333));
    TextStyle displayNameStyle =
        const TextStyle(fontSize: 13, color: Color(0xFF999999));
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CommonExtendedImageWidget.netWorkImget(
                url: _avatar ?? '', width: 40, height: 40),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(_title ?? '', style: titleStyle),
                Text(_displayName ?? '', style: displayNameStyle),
                const Padding(padding: EdgeInsets.only(top: 2)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 10),
        ],
      ),
    );
  }

  ///PLUS信息
  Widget _creatNewPlusBlackCardView(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        double screenWidth = p1.maxWidth;
        double itemCardW = (screenWidth) / 3;
        double itemCardH = 50.0;
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  ExtendedNetworkImageProvider(_newPlusBlackCardbgImage ?? ''),
              fit: BoxFit.cover,
            ),
          ),
          child: GridView.builder(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: itemCardW / itemCardH,
            ),
            itemBuilder: (BuildContext context, int position) {
              return _createGridViewItem(context, position); //布局样式自己定义
            },
          ),
        );
      },
    );
  }

  Widget _createGridViewItem(BuildContext context, int position) {
    Map info = {};
    if (position == 0) {
      info = widget.floor?["data"]?["newPlusBlackCard"]?["leftInfo"] ?? {};
    } else if (position == 1) {
      info = widget.floor?["data"]?["newPlusBlackCard"]?["midInfo"] ?? {};
    } else if (position == 2) {
      info = widget.floor?["data"]?["newPlusBlackCard"]?["rightInfo"] ?? {};
    }
    String? imageUrl = info["imageUrl"] ?? "";
    String? title = info["title"]?["value"];
    String? subtitle = info["subtitle"]?["value"];
    String? bizArrow = info["bizArrow"];

    TextStyle titleStyle = TextStyle(
        fontSize: 14,
        color: getColorFromHex(info["title"]?["color"] ?? "#FFEEEEEE"));
    TextStyle subtitleStyle = TextStyle(
        fontSize: 12,
        color: getColorFromHex(info["subtitle"]?["color"] ?? "#FFEEEEEE"));

    WidgetSpan bizArrowWidget = WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: CommonExtendedImageWidget.netWorkImget(
          url: bizArrow ?? '', width: 15),
    );

    if (position == 0) {
      return GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$subtitle"),
          ));
        },
        child: Column(
          children: [
            SizedBox(
                height: 20,
                child: CommonExtendedImageWidget.netWorkImget(
                    url: imageUrl ?? '')),
            Container(
              padding: const EdgeInsets.only(top: 5),
              alignment: Alignment.center,
              child: RichText(
                maxLines: 1,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  children: [
                    TextSpan(text: subtitle, style: subtitleStyle),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$title"),
          ));
        },
        child: Container(
          alignment: Alignment.center,
          child: RichText(
            maxLines: 2,
            overflow: TextOverflow.clip,
            text: TextSpan(
              children: [
                TextSpan(text: title, style: titleStyle),
                bizArrowWidget,
                const TextSpan(text: '\n'),
                TextSpan(text: subtitle, style: subtitleStyle),
              ],
            ),
          ),
        ),
      );
    }
  }
}
