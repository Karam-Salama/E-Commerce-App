
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/categories_cubit.dart';
import '../screens/product_details_screen.dart';
import 'custom_category_card.dart';

class ProductsListByCategory extends StatelessWidget {
  const ProductsListByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is ProductsByCategoryLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductsByCategoryFailureState) {
          return Center(child: Text(state.errorMessage));
        } else if (state is ProductsByCategorySuccessState) {
          return GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              mainAxisExtent: 245,
            ),
            itemBuilder: (context, index) {
              return CustomCategoryCard(
                productModel: state.products[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                        product: state.products[index],
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
