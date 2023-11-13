import 'dart:async';
import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class OPOrderGoodsView extends StatefulWidget {
  final Map? floor;
  final int? vendorId;
  const OPOrderGoodsView({
    Key? key,
    this.floor = const {},
    this.vendorId,
  }) : super(key: key);

  @override
  State createState() => _OPOrderGoodsViewState();
}

class _OPOrderGoodsViewState extends State<OPOrderGoodsView> {
  final String imgUrlBaseUrl = "https://m.360buyimg.com/mobilecms/s714x714_";
  Map _product = {};
  String? _wname;
  String? _imageUrl;
  String? _goodId;
  @override
  void initState() {
    _product = widget.floor ?? {};
    _wname = _product["Name"] ?? "";
    _imageUrl = imgUrlBaseUrl + (_product["ImgUrl"] ?? "");
    _goodId = "${(_product["Id"] ?? -1)}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _createSingleGoodView(),
      ],
    );
  }

  ///单个商品展示
  Widget _createSingleGoodView() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFEEEEEE), width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createLeftView(),
          _createRightView(),
        ],
      ),
    );
  }

  /// 左侧
  Widget _createLeftView() {
    return Column(
      children: [
        Row(children: [_buildCheckBox(), _createIconImageView()])
      ],
    );
  }

  Widget _buildCheckBox() {
    return Consumer<CarProvider>(
      builder: (context, vm, _) {
        List? selectGoodIds = vm.selectedDatas[widget.vendorId] ?? [];
        bool? isSelect = selectGoodIds?.contains(_goodId) ?? false;
        return Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.transparent),
          ),
          child: SizedBox(
            width: 30,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.circle,
                color: isSelect ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                vm.updateSelectedGoodIds(_goodId, widget.vendorId);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _createIconImageView() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, width: 1),
      ),
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 80,
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CommonExtendedImageWidget.netWorkImget(url: _imageUrl ?? ''),
          ),
        ),
      ),
    );
  }

  /// 右侧
  Widget _createRightView() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
        child: Column(
          children: [
            _buildWname(),
            _buildPropertyTags(),
            _buildSkuLabels(),
            _buildSecKillEndTime(),
            _buildPrice(),
            _buildLandedPrice(),
            _buildGiftInfoView(),
          ],
        ),
      ),
    );
  }

  // 名字
  Widget _buildWname() {
    return CommonIconLableWidget(text: _wname, maxLines: 2);
  }

  // 属性标签
  Widget _buildPropertyTags() {
    String a = _product["propertyTags"]?["a"] ?? "";
    String c = _product["propertyTags"]?["c"] ?? "";
    TextStyle style = const TextStyle(
      fontSize: 12,
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
    );
    return CommonTagsWidget(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.transparent),
              color: Colors.grey.shade200,
            ),
            child:
                CommonIconLableWidget(text: a + c, maxLines: 1, style: style),
          ),
        )
      ],
    );
  }

  // 秒杀
  Widget _buildSecKillEndTime() {
    // "secKillEndTime": "07月28日 00:00",
    String secKillEndTime = _product["secKillEndTime"] ?? "";
    if (HyzyTextTools.isEmpty(secKillEndTime)) {
      return Container();
    }

    int timeLeft = 60 * 60 * 3;

    String time = "2022-08-29 00:00:00";
    DateTime endDate = DateTime.parse(time);
    DateTime startDate = DateTime.now();
    timeLeft = endDate.difference(startDate).inSeconds; // 924878906 秒

    TextStyle style = const TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.bold,
      height: 1,
    );
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Text("秒杀：", style: style),
          MpsfCountdown2(
            timeLeft: timeLeft,
            itemBuilder: (time, hour, minute, second) {
              //秒数除以60*60*24（一天86400秒）得到天
              String day = time ~/ (60 * 60 * 24) > 0
                  ? "${(time ~/ (60 * 60 * 24))}"
                  : "";
              List<Widget> children = [
                timeBoxWidget("$day天"),
                const Text(":", style: TextStyle(height: 1, fontSize: 12)),
                timeBoxWidget("$hour小时"),
                const Text(":", style: TextStyle(height: 1, fontSize: 12)),
                timeBoxWidget("$minute分钟"),
                const Text(":", style: TextStyle(height: 1, fontSize: 12)),
                timeBoxWidget("$second秒"),
              ];
              return children;
            },
          )
        ],
      ),
    );
  }

  Widget timeBoxWidget(String text) {
    TextStyle style = const TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.bold,
      height: 1,
    );
    return Container(
      // width: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 1),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(text, style: style),
    );
  }

  // sku标签
  Widget _buildSkuLabels() {
    List labelList = _product["skuLabels"]?["skuHead"] ?? [];
    List tags = labelList.map((e) => e["vt"] ?? "免息").toList();
    return CommonTagsWidget(margin: const EdgeInsets.only(top: 5), tags: tags);
  }

  /// 价格
  Widget _buildPrice() {
    String priceShow = _product["PriceShow"] ?? "";
    TextStyle style = const TextStyle(fontSize: 18, color: Colors.red);
    if (HyzyTextTools.isEmpty(priceShow)) {
      return Container();
    }
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CommonIconLableWidget(text: priceShow, style: style)
        ],
      ),
    );
  }

  ///预估到手价
  Widget _buildLandedPrice() {
    String landedPrice = _product["landedPrice"] ?? "";
    if (HyzyTextTools.isEmpty(landedPrice)) {
      return Container();
    }
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CommonIconLableWidget(
            text: landedPrice,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  ///赠品
  Widget _buildGiftInfoView() {
    String text = "赠品";
    List labelList = _product["Gifts"] ?? [];
    if (labelList.isEmpty) {
      return Container();
    } else {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.transparent),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _createIconText(text),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: labelList.length > 1 ? 2 : 1,
                itemBuilder: (content, index) {
                  Map gift = labelList[index];
                  String value = gift["Name"];
                  return CommonIconLableWidget(text: value);
                },
              ),
            )
          ],
        ),
      );
    }
  }

  Widget _createIconText(String text) {
    return Container(
        padding: const EdgeInsets.all(2),
        color: Colors.red.shade100,
        child: Text(text,
            style: const TextStyle(fontSize: 10, color: Colors.red)));
  }
}

// 倒计时Widget
class MpsfCountdown2 extends StatefulWidget {
  final int timeLeft;
  final List<Widget> Function(
      int time, String hour, String minute, String second) itemBuilder;
  const MpsfCountdown2({
    Key? key,
    this.timeLeft = 0,
    required this.itemBuilder,
  }) : super(key: key);
  @override
  _MpsfCountdown2State createState() => _MpsfCountdown2State();
}

class _MpsfCountdown2State extends State<MpsfCountdown2> {
  late int time;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    time = widget.timeLeft;
    initTimer();
  }

  initTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time > 0) {
        setState(() {
          time--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //秒数除以60（一分钟60秒）取余得到秒
    String second = time % 60 > 0 ? "${time % 60}" : "0";

    //秒数除以60*60（一个小时3600秒）取余，再除以60（一小时60分钟）得到分钟
    String minute =
        time % (60 * 60) ~/ 60 > 0 ? "${(time % (60 * 60) ~/ 60)}" : "0";

    //秒数除以60*60*24（一天86400秒）取余，再除以60*60（一小时3600秒）得到小时
    String hour = time % (60 * 60 * 24) ~/ (60 * 60) > 0
        ? "${(time % (60 * 60 * 24) ~/ (60 * 60))}"
        : "0";

    List<Widget> children = widget.itemBuilder(time, hour, minute, second);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget itemBoxWidget(String text) {
    TextStyle style = const TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.bold,
      height: 1,
    );
    return Container(
      width: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 1),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(text, style: style),
    );
  }

  //分号
  Widget colonWidget() {
    return const Text(":", style: TextStyle(height: 1, fontSize: 12));
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
