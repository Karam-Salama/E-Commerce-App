import 'package:ecommerce_app/modules/home/domain/repos/home_repo.dart';
import 'package:ecommerce_app/modules/home/presentation/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/service_locator.dart';
import '../widgets/favorite_body.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
static const routeName = '/favorite-screen';  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductsCubit(getIt<HomeRepo>())..getProductsInHome(),
        child: FavoriteBody(),
      ),
    );
  }
}
