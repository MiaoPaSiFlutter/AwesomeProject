import 'package:flutter/material.dart';
import '../constant/constant_index.dart';

class MenuTileWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final String? subtitle;
  final Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final Color? iconBackground;
  final Color? titleColor;

  const MenuTileWidget({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.margin,
    this.iconBackground = AppColor.primarySoft,
    this.titleColor = AppColor.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColor.primarySoft, width: 1),
          ),
        ),
        child: Row(
          children: [
            // Icon Box
            Container(
              width: 46,
              height: 46,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: iconBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: icon,
            ),
            // Info
            Expanded(
              child: (subtitle == null)
                  ? Text(title,
                      style: TextStyle(
                          color: titleColor,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w500))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: const TextStyle(
                                color: AppColor.secondary,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w500)),
                        const SizedBox(height: 2),
                        Text('$subtitle',
                            style: TextStyle(
                                color: AppColor.secondary.withOpacity(0.7),
                                fontSize: 12)),
                      ],
                    ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColor.border,
            ),
          ],
        ),
      ),
    );
  }
}
