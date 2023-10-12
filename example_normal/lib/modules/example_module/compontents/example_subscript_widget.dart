import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class ExampleSubscriptWidget extends StatefulWidget {
  const ExampleSubscriptWidget({
    super.key,
    required this.index,
    required this.allNum,
  });
  final int index;
  final int allNum;
  @override
  State<StatefulWidget> createState() {
    return ExampleSubscriptState();
  }
}

class ExampleSubscriptState extends CommonState<ExampleSubscriptWidget> {
  @override
  bool get isNeedScaffol => false;

  int relaIndex = 0;

  @override
  void initDefaultState() {
    relaIndex = widget.index;
    super.initDefaultState();
  }

  @override
  configBoxDecoreation() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.black45,
          Colors.black38,
          Colors.black26,
          Colors.black12,
          Colors.black.withOpacity(0),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "${relaIndex + 1}",
            style: HzyTextStyle.fontBold(
              size: 25.sp,
              color: HzyNormalColorS.colffffff,
            ),
          ),
          TextSpan(
            text: " / ${widget.allNum}",
            style: HzyTextStyle.fontMedium(
              size: 14,
              color: HzyNormalColorS.colffffff,
            ),
          )
        ],
      ),
    );

    body = Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(
        right: 20,
        top: SizeMacro.statusBarHeight,
      ),
      child: body,
    );
    return body;
  }

  configCurrentIndex({required int index}) {
    if (relaIndex != index) {
      setState(() {
        relaIndex = index;
      });
    }
  }
}
