import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/service_locator.dart';
import '../../domain/repos/home_repo.dart';
import '../cubit/banners_cubit.dart';
import '../cubit/categories_cubit.dart';
import '../cubit/products_cubit.dart';
import '../widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BannersCubit(getIt<HomeRepo>())..getBannersData()
        ),
        BlocProvider(
          create: (context) =>
              CategoriesCubit(getIt<HomeRepo>())..getCategoriesData(),
        ),
        BlocProvider(
          create: (context) =>
              ProductsCubit(getIt<HomeRepo>())..getProducts(),
        ),
      ],
      child: Scaffold(
        body: HomeBody(),
      ),
    );
  }
}
