import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../../vm/product_detail_viewmodel.dart';

class BpBpParam extends StatelessWidget {
  const BpBpParam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpParam");
    List cccKernel = floor?["data"]?["CccKernel"] ?? [];
    if (floor == null) {
      return Container();
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: const Text("规格", style: TextStyle(fontSize: 12)),
          ),
          Expanded(
            child: SizedBox(
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: cccKernel.length,
                itemBuilder: (context, index) {
                  String icon = cccKernel[index]?["icon"] ?? "";
                  String paramName = cccKernel[index]?["paramName"] ?? "";
                  String paramValue = cccKernel[index]?["paramValue"] ?? "";

                  return SizedBox(
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonExtendedImageWidget.netWorkImget(
                            url: icon, width: 20),
                        Text(paramName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 10, color: Colors.grey)),
                        Text(paramValue,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 10, color: Colors.grey))
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  CommonExtendedImageWidget.netWorkImget(url: "", width: 20),
                  const Text("商品对比",
                      style: TextStyle(fontSize: 10, color: Colors.grey))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
