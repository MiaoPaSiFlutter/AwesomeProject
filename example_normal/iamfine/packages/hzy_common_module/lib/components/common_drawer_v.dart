import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';
import '../config/config_index.dart';
import '../utils/screenutil_tools.dart';
import 'common_state.dart';

enum CommonDrawerType {
  left,
  right,
  top,
  bottom,
}

class CommonDrawerPage extends StatefulWidget {
  /// 抽屉宽度
  final double? drawerWidth;

  /// 主体
  final Widget? bodyView;

  /// 抽屉视图
  final Widget? drawerWidget;

  /// 抽屉打开状态回调
  final Function(bool)? drawerIsOpen;

  /// 是否显示蒙层
  /// 默认true
  final bool? isShowSmegma;

  /// 菜单动画icon
  final AnimatedIconData? animatedIconData;

  /// 菜单
  final Widget? menuView;

  /// 滚动回调
  final Function(double offset)? onScroll;

  /// 抽屉类型
  /// 左右
  /// 右左
  /// 上下
  /// 下上
  final CommonDrawerType? type;
  const CommonDrawerPage({
    super.key,
    this.onScroll,
    this.drawerWidth = 200,
    this.bodyView,
    this.drawerWidget,
    this.type = CommonDrawerType.left,
    this.drawerIsOpen,
    this.animatedIconData,
    this.menuView,
    this.isShowSmegma = true,
  });

  @override
  State<StatefulWidget> createState() {
    return CommonDrawerState();
  }
}

class CommonDrawerState extends CommonState<CommonDrawerPage>
    with TickerProviderStateMixin {
  late ScrollController scrollController;
  late AnimationController iconAnimationController;
  late AnimationController animationController;
  double scrolloffset = 0.0;
  @override
  bool get isNeedScaffol => false;
  @override
  bool get safeAreabottm => false;
  @override
  bool configSafeAreaTop() => false;

  /// 配置抽屉布局样式
  late CommonDrawerType drawerType;

  /// 进度条
  double progress = 0;
  @override
  void initState() {
    /// 赋值抽屉样式
    drawerType = widget.type ?? CommonDrawerType.left;

    /// 初始化动画控制器
    initAniamtionS();

    /// 监听滑动
    initaddListener();

    /// 监听界面第一次渲染完成
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getInitState();
    });
    super.initState();
  }

  @override
  void initDefaultDispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.initDefaultDispose();
    animationController.dispose();
    iconAnimationController.dispose();
  }

  @override
  Widget createBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    /// 创建主界面
    Widget body = configScrollChild();
    body = SizedBox(
      height: configBoxSize().height,
      width: configBoxSize().width,
      child: body,
    );
    body = SingleChildScrollView(
      controller: scrollController,
      scrollDirection: configScrollDirection(),
      physics: const PageScrollPhysics(
        parent: ClampingScrollPhysics(),
      ),
      child: body,
    );

    return body;
  }

  /// 创建Drawer
  configDrawerWidget() {
    Widget body = AnimatedBuilder(
      animation: iconAnimationController,
      builder: (context, child) {
        Widget bt = widget.drawerWidget ?? Container();
        bt = Transform(
          transform: configTranslationValues(),
          child: bt,
        );
        return bt;
      },
    );

    body = SizedBox(
      width: configDrawerSize().width,
      height: configDrawerSize().height,
      child: body,
    );

    return body;
  }

  /// 创建主页面
  configNormalBodyWidget() {
    Widget body = IgnorePointer(
      ignoring: scrolloffset == 1 || false,
      child: widget.bodyView,
    );

    body = Stack(
      children: [
        widget.bodyView ?? Container(),
        configAppBarBtnWidget(),
        configSmegmaWidget()
      ],
    );
    body = Container(
      decoration: BoxDecoration(
        color: HzyCommonColor().whitebackgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: HzyNormalColorS.grey.withOpacity(0.6),
            blurRadius: 24.r,
          ),
        ],
      ),
      child: body,
    );
    body = SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: body,
    );
    return body;
  }

  /// 创建灰色蒙层
  configSmegmaWidget() {
    double ct = Tween<double>(begin: 0, end: 0.2).transform(
      progress,
    );

    Widget body = Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, ct),
      ),
    );

    body = InkWell(
      onTap: () {
        configDraweAnimation();
      },
      child: body,
    );

    body = Positioned.fill(
      child: body,
    );

    body =
        ((widget.isShowSmegma ?? true) && progress > 0.2) ? body : Container();
    dPrint(body);
    return body;
  }

  /// 创建导航栏按钮
  configAppBarBtnWidget() {
    /// 创建按钮
    Widget body = InkWell(
      borderRadius: BorderRadius.circular(
        AppBar().preferredSize.height,
      ),
      child: Center(
        child: widget.menuView ??
            AnimatedIcon(
              icon: widget.animatedIconData != null
                  ? widget.animatedIconData!
                  : configNormalAnimatedIconData(),
              progress: iconAnimationController,
            ),
      ),
      onTap: () {
        configDraweAnimation();
      },
    );

    body = SizedBox(
      width: 40,
      height: 40,
      child: body,
    );

    switch (drawerType) {
      case CommonDrawerType.left:
        body = Positioned(
          left: 5,
          top: SizeMacro.statusBarHeight + (kToolbarHeight - 40) / 2,
          child: body,
        );
        break;
      case CommonDrawerType.right:
        body = Positioned(
          right: 5,
          top: SizeMacro.statusBarHeight + (kToolbarHeight - 40) / 2,
          child: body,
        );
        break;
      default:
        body = Container();
        break;
    }
    return body;
  }

  /// 配置滚动 子视图
  configScrollChild() {
    Widget body = Container();
    switch (drawerType) {
      case CommonDrawerType.left:
        body = Row(
          children: [
            configDrawerWidget(),
            configNormalBodyWidget(),
          ],
        );
        break;
      case CommonDrawerType.right:
        body = Stack(
          children: [
            Positioned(
              left: SizeMacro.screenWidth,
              top: 0,
              bottom: 0,
              child: configDrawerWidget(),
            ),
            configNormalBodyWidget(),
          ],
        );
        break;
      case CommonDrawerType.top:
        body = Column(
          children: [
            configDrawerWidget(),
            configNormalBodyWidget(),
          ],
        );
        break;
      case CommonDrawerType.bottom:
        body = Column(
          children: [
            configNormalBodyWidget(),
            configDrawerWidget(),
          ],
        );
        body = Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              top: SizeMacro.screenHeight,
              right: 0,
              child: configDrawerWidget(),
            ),
            configNormalBodyWidget(),
          ],
        );
        break;
      default:
    }
    return body;
  }

  /// 配置 滚动方向
  configScrollDirection() {
    Axis scrollDirection = Axis.horizontal;
    switch (drawerType) {
      case CommonDrawerType.left:
      case CommonDrawerType.right:
        scrollDirection = Axis.horizontal;
        break;
      case CommonDrawerType.top:
      case CommonDrawerType.bottom:
        scrollDirection = Axis.vertical;
        break;
      default:
    }
    return scrollDirection;
  }

  /// 配置整体大小
  Size configBoxSize() {
    double mH = MediaQuery.of(context).size.height;
    double mW = MediaQuery.of(context).size.width;
    double dw = configDrawerW();
    Size size = Size.zero;
    switch (drawerType) {
      case CommonDrawerType.top:
      case CommonDrawerType.bottom:
        size = Size(mW, mH + dw);
        break;
      case CommonDrawerType.left:
      case CommonDrawerType.right:
        size = Size(mW + dw, mH);
        break;
      default:
    }
    return size;
  }

  /// 配置抽屉大小
  Size configDrawerSize() {
    double mW = MediaQuery.of(context).size.width;
    double dw = configDrawerW();
    double mH = MediaQuery.of(context).size.height;
    Size size = Size.zero;
    switch (drawerType) {
      case CommonDrawerType.top:
      case CommonDrawerType.bottom:
        size = Size(
          mW,
          dw,
        );
        break;
      case CommonDrawerType.left:
      case CommonDrawerType.right:
        size = Size(
          dw,
          mH,
        );
        break;
      default:
    }
    return size;
  }

  /// 配置抽屉 动画进度
  Matrix4 configTranslationValues() {
    Matrix4 transform = Matrix4.translationValues(
      scrollController.offset,
      0.0,
      0.0,
    );
    switch (drawerType) {
      case CommonDrawerType.top:
        transform = Matrix4.translationValues(
          0.0,
          scrollController.offset,
          0.0,
        );
        break;
      case CommonDrawerType.bottom:
        transform = Matrix4.translationValues(
          0.0,
          -configDrawerW() + scrollController.offset,
          0.0,
        );
        break;
      case CommonDrawerType.left:
        transform = Matrix4.translationValues(
          scrollController.offset,
          0.0,
          0.0,
        );
        break;

      case CommonDrawerType.right:
        transform = Matrix4.translationValues(
          -configDrawerW() + scrollController.offset,
          0.0,
          0.0,
        );
        break;
      default:
    }
    return transform;
  }

  configDrawerW() {
    double dw = (widget.drawerWidth ?? 200);
    return dw;
  }

  /// 初始化滚动位置
  configInitialScrollOffset() {
    double offSet = 0;
    switch (drawerType) {
      case CommonDrawerType.top:
        offSet = configDrawerW();
        break;
      case CommonDrawerType.bottom:
        offSet = 0;
        break;
      case CommonDrawerType.left:
        offSet = configDrawerW();
        break;
      case CommonDrawerType.right:
        offSet = 0;
        break;
      default:
    }
    return offSet;
  }

  /// 配置Icon 控制器的初始值
  configIconAnimSlidStar() {
    double offSet = 0;
    switch (drawerType) {
      case CommonDrawerType.top:
        offSet = 0;
        break;
      case CommonDrawerType.bottom:
        offSet = 0;
        break;
      case CommonDrawerType.left:
        offSet = 1.0;
        break;
      case CommonDrawerType.right:
        offSet = 1.0;
        break;
      default:
    }
    return offSet;
  }

  /// 配置Icon控制器滚动中动画值
  configIconAnimSliding() {
    double offSet = 0;
    double normalOffSet = (scrollController.offset / (widget.drawerWidth!));

    double pg = 0;
    switch (drawerType) {
      case CommonDrawerType.top:
        offSet = normalOffSet;
        pg = 1 - normalOffSet;
        break;
      case CommonDrawerType.bottom:
        offSet = normalOffSet;
        pg = normalOffSet;
        break;
      case CommonDrawerType.left:
        offSet = normalOffSet;
        pg = 1 - normalOffSet;
        break;
      case CommonDrawerType.right:
        offSet = 1 - normalOffSet;
        pg = normalOffSet;
        break;
      default:
    }
    dPrint("进度条$pg");
    setState(() {
      progress = pg;
    });
    return offSet;
  }

  /// 配置Icon 控制器结束值
  configIconAnimSlidEnd() {
    double offSet = 0;
    switch (drawerType) {
      case CommonDrawerType.top:
        offSet = -configDrawerW();
        break;
      case CommonDrawerType.bottom:
        offSet = 0;
        break;
      case CommonDrawerType.left:
        offSet = 0;
        break;
      case CommonDrawerType.right:
        offSet = 1;
        break;
      default:
    }
    return offSet;
  }

  configNormalAnimatedIconData() {
    AnimatedIconData animatedIconData = AnimatedIcons.arrow_menu;
    switch (drawerType) {
      case CommonDrawerType.left:
        animatedIconData = AnimatedIcons.arrow_menu;
        break;
      case CommonDrawerType.right:
        animatedIconData = AnimatedIcons.close_menu;
        break;
      default:
    }
    return animatedIconData;
  }

  initaddListener() {
    scrollController.addListener(
      () {
        if (widget.onScroll != null) {
          widget.onScroll!(scrollController.offset);
        }
        dPrint(scrollController.offset);
        if (scrollController.offset <= 0) {
          if (scrolloffset != 1.0) {
            setState(
              () {
                scrolloffset = 1.0;
                if (widget.drawerIsOpen != null) {
                  widget.drawerIsOpen!(true);
                }
              },
            );
          }
          iconAnimationController.animateTo(
            configIconAnimSlidEnd(),
            duration: const Duration(milliseconds: 0),
            curve: Curves.fastOutSlowIn,
          );
        } else if (scrollController.offset > 0 &&
            scrollController.offset <= widget.drawerWidth!) {
          iconAnimationController.animateTo(
            configIconAnimSliding(),
            duration: const Duration(milliseconds: 0),
            curve: Curves.fastOutSlowIn,
          );
          if (scrolloffset != 0.0) {
            setState(
              () {
                scrolloffset = 0.0;
                if (widget.drawerIsOpen != null) {
                  widget.drawerIsOpen!(false);
                }
              },
            );
          }
        }
      },
    );
  }

  /// 初始化所需要的控制器
  initAniamtionS() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2000,
      ),
    );
    iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 0,
      ),
    );
    iconAnimationController.animateTo(
      configIconAnimSlidStar(),
      duration: const Duration(milliseconds: 0),
      curve: Curves.fastOutSlowIn,
    );
    scrollController = ScrollController(
      initialScrollOffset: configInitialScrollOffset(),
    );
  }

  /// 页面渲染完成后，进行界面滚动操作
  Future<bool> getInitState() async {
    scrollController.jumpTo(
      configInitialScrollOffset(),
    );
    return true;
  }

  /// 点击关闭动画
  void configDraweAnimation() {
    if (scrollController.offset != 0.0) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      scrollController.animateTo(
        widget.drawerWidth!,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
