
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/service_locator.dart';
import '../../home/domain/repos/home_repo.dart';
import '../../home/presentation/cubit/categories_cubit.dart';
import '../widgets/categories_body.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
static const routeName = '/categories-screen';  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CategoriesCubit(getIt<HomeRepo>())..getCategoriesData(),
        child: CategoriesBody(),
      ),
    );
  }
}
