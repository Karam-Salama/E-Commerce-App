import 'package:flutter/material.dart';

import 'custom_home_banners_item.dart';

class CustomHomeBannersList extends StatelessWidget {
  const CustomHomeBannersList({super.key});
  final int itemCount = 3;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomHomeBannersItem();
        },
      ),
    );
  }
}
