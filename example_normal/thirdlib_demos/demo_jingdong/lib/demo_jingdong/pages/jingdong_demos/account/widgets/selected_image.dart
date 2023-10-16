import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class SelectedImage extends StatelessWidget {
  const SelectedImage({
    Key? key,
    this.size = 80.0,
    required this.onTap,
    this.image,
  }) : super(key: key);

  final double size;
  final GestureTapCallback onTap;
  final File? image;

  @override
  Widget build(BuildContext context) {
    String assetName = NormalModuleUtils.configPackagesImage(
        packagename: 'demo_jingdong',
        name: "assets/images/jingdong_demos/store/icon_zj.png");

    return InkWell(
      borderRadius: BorderRadius.circular(16.0),
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
              image: image == null
                  ? NormalModuleUtils.getImageProvider(assetName)
                  : FileImage(image!),
              fit: BoxFit.cover,
              colorFilter: image == null
                  ? const ColorFilter.mode(Colors.transparent, BlendMode.srcIn)
                  : null),
        ),
      ),
    );
  }

  ImageProvider getAssetImage(String assetName) {
    return AssetImage(assetName);
  }
}
