import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/product_model.dart';
import '../../domain/repos/home_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.homeRepo) : super(ProductsInitial());
  final HomeRepo homeRepo;
  
  Future<void> getProducts() async {
    emit(ProductsLoadingState());
    final response = await homeRepo.getProsucts();
    response.fold(
      (failure) => emit(ProductsFailureState(errorMessage: failure)),
      (products) => emit(ProductsSuccessState(products: products)),
    );
  }
}
