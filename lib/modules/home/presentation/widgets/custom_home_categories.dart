import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/categories_cubit.dart';

import 'category_details.dart';
import 'custom_home_category_item.dart';

class CustomHomeCategoriesList extends StatelessWidget {
  const CustomHomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoadingState) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is CategoriesFailureState) {
          return SizedBox(
            height: 200,
            child: Center(child: Text(state.errorMessage)),
          );
        } else if (state is CategoriesSuccessState) {
          return SizedBox(
            height: size.height * 0.2,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = state.categories[index];
                return CustomHomeCategoryItem(
                  category: category,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryDetails(
                          category: category,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
