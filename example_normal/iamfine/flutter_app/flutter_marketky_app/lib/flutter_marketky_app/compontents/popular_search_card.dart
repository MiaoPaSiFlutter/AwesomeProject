import 'package:flutter/material.dart';
import '../constant/constant_index.dart';
import '../models/models_index.dart';

class PopularSearchCard extends StatelessWidget {
  final PopularSearch data;
  final Function()? onTap;
  const PopularSearchCard({
    super.key,
    required this.data,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: AppColor.primarySoft,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage('${data.imageUrl}'),
                ),
              ),
            ),
            Expanded(
              child: Text('${data.title}'),
            ),
          ],
        ),
      ),
    );
  }
}
