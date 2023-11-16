import 'package:flutter/material.dart';
import '../constant/constant_index.dart';
import '../models/models_index.dart';

class UpdateCardWidget extends StatelessWidget {
  final ExploreUpdate data;
  const UpdateCardWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section 1 - Header
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: AppColor.primarySoft,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage('${data.logoUrl}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data.storeName}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins',
                          color: AppColor.secondary,
                        ),
                      ),
                      Text(
                        '72k Followers',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColor.secondary.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: AppColor.primary,
                  ),
                  child: const Text('follow',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'poppins',
                          fontSize: 12)),
                ),
              ],
            ),
          ),
          // Section 2 - Image
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColor.primarySoft,
              image: DecorationImage(
                image: AssetImage('${data.image}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Section 3 - Caption
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              '${data.caption}',
              style: const TextStyle(height: 150 / 100),
            ),
          )
        ],
      ),
    );
  }
}
