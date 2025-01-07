import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/category_model.dart';
import '../../domain/repos/home_repo.dart';

part 'categories_state.dart';


class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepo homeRepo;

  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());

  void getCategoriesData() async {
    emit(CategoriesLoadingState());
    final response = await homeRepo.getCategoriesData();
    response.fold(
      (failure) => emit(CategoriesFailureState(errorMessage: failure)),
      (categories) => emit(CategoriesSuccessState(categories: categories)),
    );
  }
}
