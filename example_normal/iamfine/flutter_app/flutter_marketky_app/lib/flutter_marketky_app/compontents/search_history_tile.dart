import 'package:flutter/material.dart';
import '../constant/constant_index.dart';
import '../models/models_index.dart';

class SearchHistoryTile extends StatelessWidget {
  const SearchHistoryTile({super.key, required this.data, this.onTap});

  final SearchHistory data;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: AppColor.primarySoft,
              width: 1,
            ),
          ),
        ),
        child: Text('${data.title}'),
      ),
    );
  }
}
