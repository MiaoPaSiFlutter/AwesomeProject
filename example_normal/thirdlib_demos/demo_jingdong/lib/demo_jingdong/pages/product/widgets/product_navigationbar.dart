import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';

import '../vm/product_detail_viewmodel.dart';

class BPProductNavigationBar extends StatelessWidget {
  final void Function(int index)? onSelectIndex;
  const BPProductNavigationBar({Key? key, this.onSelectIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailViewModel>(
      builder: (context, ProductDetailViewModel vm, _) {
        return _renderAppBar(context, vm);
      },
    );
  }

  Widget _renderAppBar(BuildContext context, ProductDetailViewModel vm) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, vm.appBarAlpha),
          ),
          child: Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Stack(
              children: [
                SizedBox(
                  height: 44,
                  child: Align(
                    alignment: const FractionalOffset(0.5, 0.5),
                    child: _segmentsView(context, vm),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: SizedBox(
                    height: 44,
                    child: _renderBackBtn(context, vm),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: SizedBox(
                    height: 44,
                    child: _renderRightItems(context, vm),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// 返回按钮
  Widget _renderBackBtn(BuildContext context, ProductDetailViewModel vm) {
    bool showAppBar = vm.appBarAlpha >= 1;
    return InkWell(
      onTap: () {
        currentGoback();
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        child: Image.asset(
          showAppBar
              ? NormalModuleUtils.configPackagesImage(
                  packagename: 'demo_jingdong',
                  name: 'assets/images/product/back_gray_Normal.png')
              : NormalModuleUtils.configPackagesImage(
                  packagename: 'demo_jingdong',
                  name: 'assets/images/product/back_white_Normal.png'),
          width: 25,
        ),
      ),
    );
  }

  Widget _renderRightItems(BuildContext context, ProductDetailViewModel vm) {
    bool showAppBar = vm.appBarAlpha >= 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            currentGoback();
          },
          child: Container(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              showAppBar
                  ? NormalModuleUtils.configPackagesImage(
                      packagename: 'demo_jingdong',
                      name: 'assets/images/product/share_gray_Normal.png')
                  : NormalModuleUtils.configPackagesImage(
                      packagename: 'demo_jingdong',
                      name: 'assets/images/product/share_white_Normal.png'),
              width: 25,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            currentGoback();
          },
          child: Container(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              showAppBar
                  ? NormalModuleUtils.configPackagesImage(
                      packagename: 'demo_jingdong',
                      name: 'assets/images/product/more_white_Normal.png')
                  : NormalModuleUtils.configPackagesImage(
                      packagename: 'demo_jingdong',
                      name: 'assets/images/product/more_black_Normal.png'),
              width: 25,
            ),
          ),
        ),
      ],
    );
  }

  Widget _segmentsView(BuildContext context, ProductDetailViewModel vm) {
    bool showAppBar = vm.appBarAlpha >= 1;
    List segments = ["商品", "评价", "详情", "推荐"];
    return AnimatedOpacity(
      opacity: showAppBar ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: segments.map((e) {
          return InkWell(
            onTap: () {
              if (!showAppBar) {
                return;
              }
              vm.updateTopSelectIndex(segments.indexOf(e));
              if (onSelectIndex != null) {
                onSelectIndex!(segments.indexOf(e));
              }
              ;
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                "$e",
                style: TextStyle(
                  fontSize: vm.selectIndex == segments.indexOf(e) ? 16 : 14,
                  color: vm.selectIndex == segments.indexOf(e)
                      ? Colors.red
                      : Colors.black,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
