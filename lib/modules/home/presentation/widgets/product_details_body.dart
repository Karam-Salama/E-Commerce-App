import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/text_style.dart';
import '../../data/models/product_model.dart';
import '../cubit/products_cubit.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    ProductsCubit productsCubit = BlocProvider.of<ProductsCubit>(context);
    return Scaffold(
      body: ListView(
        children: [
          // Image Section
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.image),
                fit: BoxFit.fill,
              ),
              color: const Color(0xFFF2F3F2),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      productsCubit.toggleFavorite(product.id);
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: productsCubit.favorites[product.id] == true
                          ? AppColors.primaryColor
                          : AppColors.darkGrey,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              product.name,
              style: AppTextStyles.poppins500black14,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Product Name and Price Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text(
                  "\$${product.price.toStringAsFixed(2)}",
                  style: AppTextStyles.poppins500black14.copyWith(
                    color: AppColors.darkGrey
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      productsCubit.decrement();
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 45.67,
                    height: 45.67,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffE2E2E2)),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Text(
                      productsCubit.count.toString(), 
                      style: TextStyle(
                        color: Color(0xFF181725),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      productsCubit.decrement();
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "\$${product.price * productsCubit.count}",
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Color(0xFF181725),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(
              thickness: 0.5,
              color: Color(0xff7C7C7C),
            ),
          ),
          const SizedBox(height: 15),

          // Product Detail Header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Product Detail',
              style: TextStyle(
                color: Color(0xFF181725),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 15),

          // Product Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              product.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Color(0xFF7C7C7C),
                fontSize: 14,
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(
              thickness: 0.5,
              color: Color(0xff7C7C7C),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
