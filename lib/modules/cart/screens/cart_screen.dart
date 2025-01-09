
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/service_locator.dart';
import '../../home/domain/repos/home_repo.dart';
import '../../home/presentation/cubit/products_cubit.dart';
import '../widgets/cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
static const routeName = '/cart-screen';  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductsCubit(getIt<HomeRepo>()),
        child: CartBody(),
      ),
    );
  }
}
