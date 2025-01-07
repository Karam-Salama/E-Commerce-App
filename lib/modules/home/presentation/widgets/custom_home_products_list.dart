import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_product_card.dart';

class CustomHomeProductsList extends StatelessWidget {
  const CustomHomeProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemBuilder: (context, index) => CustomProductCard(),
    );
  }
}
