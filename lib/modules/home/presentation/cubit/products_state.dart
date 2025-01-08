part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  final List<ProductModel> products;
  ProductsSuccessState({required this.products});
}

class ProductsFailureState extends ProductsState {
  final String errorMessage;
  ProductsFailureState({required this.errorMessage});
}

class FavoriteProductLoadingState extends ProductsState {}

class FavoriteProductSuccessState extends ProductsState {
  final ProductModel product;
  FavoriteProductSuccessState({required this.product});
}

class FavoriteProductFailureState extends ProductsState {
  final String errorMessage;
  FavoriteProductFailureState({required this.errorMessage});
}