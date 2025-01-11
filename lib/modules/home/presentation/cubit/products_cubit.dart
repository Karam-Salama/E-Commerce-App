import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/product_model.dart';
import '../../domain/repos/home_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.homeRepo) : super(ProductsInitial());
  final HomeRepo homeRepo;
  Map<int, bool> favorites = {};
  int count = 1;

  void increment() {
  if (count < 100) {
    count++;
  }
}

void decrement() {
  if (count > 0) {
    count--;
  }
}


  /// Fetch Products and Initialize Favorites
  Future<void> getProductsInHome() async {
    emit(ProductsLoadingState());
    final response = await homeRepo.getProductsInHome();

    response.fold(
      (failure) => emit(ProductsFailureState(errorMessage: failure)),
      (products) {
        for (var product in products) {
          favorites[product.id] = product.in_favorites;
        }
        emit(ProductsSuccessState(products: products));
      },
    );
  }

  /// Toggle Favorite Status for a Product
  Future<void> toggleFavorite(int productId) async {
    // 1. Optimistic Update (Instant UI Response)
    final previousState = favorites[productId];
    favorites[productId] = !favorites[productId]!;

    // Emit State to Reflect UI Change Immediately
    if (state is ProductsSuccessState) {
      final updatedProducts = (state as ProductsSuccessState)
          .products
          .map((p) => p.id == productId
              ? p.copyWith(in_favorites: favorites[productId]!)
              : p)
          .toList();
      emit(ProductsSuccessState(products: updatedProducts));
    }

    // 2. Perform the API Call
    final response = await homeRepo.getFavoritesProducts(productId: productId);

    response.fold(
      (failure) {
        // 3. Rollback on Failure
        favorites[productId] = previousState!;
        emit(FavoriteProductFailureState(errorMessage: failure));

        // Revert the Product State in UI
        if (state is ProductsSuccessState) {
          final updatedProducts = (state as ProductsSuccessState)
              .products
              .map((p) => p.id == productId
                  ? p.copyWith(in_favorites: previousState)
                  : p)
              .toList();
          emit(ProductsSuccessState(products: updatedProducts));
        }
      },
      (product) {
        // 4. Finalize State on Success
        favorites[productId] = product.in_favorites;
        emit(FavoriteProductSuccessState(product: product));

        if (state is ProductsSuccessState) {
          final updatedProducts = (state as ProductsSuccessState)
              .products
              .map((p) => p.id == productId ? product : p)
              .toList();
          emit(ProductsSuccessState(products: updatedProducts));
        }
      },
    );
  }
}
