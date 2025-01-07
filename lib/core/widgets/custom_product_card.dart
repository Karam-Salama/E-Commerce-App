import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/modules/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: AppColors.lightGrey,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            // Product Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                product.name,
                style: AppTextStyles.poppins500black14,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 6.0),
            // Price and Discount
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text('\$${product.price.toStringAsFixed(2)}',
                  style: AppTextStyles.Poppins700black14),
            ),
            const SizedBox(height: 6.0),
            // Old Price and Favorite
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '(\$${product.old_price})',
                    style: AppTextStyles.poppins400darkGrey14.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    color: AppColors.white,
                    size: 24,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
