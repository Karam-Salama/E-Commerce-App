import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/modules/home/data/models/product_model.dart';
import 'package:ecommerce_app/modules/home/presentation/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/colors.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard(
      {super.key, required this.product, required this.onTap});
  final ProductModel product;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    ProductsCubit productsCubit = BlocProvider.of<ProductsCubit>(context);
    return InkWell(
      onTap: onTap,
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
            //  Price and Favorite
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price}',
                    style: AppTextStyles.Poppins700black14,
                  ),
                  IconButton(
                    onPressed: () {
                      productsCubit.toggleFavorite(product.id);
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: productsCubit.favorites[product.id] == true
                          ? AppColors.primaryColor
                          : AppColors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
