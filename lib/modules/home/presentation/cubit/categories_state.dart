part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  final List<CategoryModel> categories;
  CategoriesSuccessState({required this.categories});
}

class CategoriesFailureState extends CategoriesState {
  final String errorMessage;
  CategoriesFailureState({required this.errorMessage});
}