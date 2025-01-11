
import 'package:ecommerce_app/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/category_model.dart';
import '../../domain/repos/home_repo.dart';
import '../cubit/categories_cubit.dart';
import 'category_details_body.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CategoriesCubit(getIt<HomeRepo>())
          ..getProductsByCategory(category.id),
        child: CategoryDetailsBody(category: category),
      ),
    );
  }
}
