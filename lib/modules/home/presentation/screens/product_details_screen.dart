import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../data/models/product_model.dart';
import '../../domain/repos/home_repo.dart';
import '../cubit/products_cubit.dart';
import '../widgets/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  static const routeName = '/Product-Details-screen';
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductsCubit(getIt<HomeRepo>()),
        child: ProductDetailsBody(product: product),
      ),
    );
  }
}


