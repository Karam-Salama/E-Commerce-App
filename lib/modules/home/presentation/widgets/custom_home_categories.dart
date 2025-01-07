import 'package:flutter/material.dart';

import 'custom_home_category_item.dart';

class CustomHomeCategoriesList extends StatelessWidget {
  const CustomHomeCategoriesList({super.key, required this.itemCount});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.1,
      child: ListView.separated(
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 8.0),
        itemBuilder: (context, index) {
          return const CustomHomeCategoryItem();
        },
      ),
    );
  }
}
