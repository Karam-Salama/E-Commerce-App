
import 'package:flutter/material.dart';

import '../../data/models/category_model.dart';
import 'products_list_by_category.dart';

class CategoryDetailsBody extends StatelessWidget {
  const CategoryDetailsBody({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: ProductsListByCategory()),
        ],
      ),
    );
  }
}
