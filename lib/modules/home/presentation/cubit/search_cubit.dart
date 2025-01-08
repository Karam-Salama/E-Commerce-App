import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/models/filtered_product_model.dart';
import '../../domain/repos/home_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());
  final HomeRepo homeRepo;
  TextEditingController productName = TextEditingController();

  Future<void> getProductsBySearch() async {
    emit(SearchLoadingState());
    final response =
        await homeRepo.getProductsBySearch(productName: productName.text);
    response.fold(
      (failure) => emit(SearchFailureState(errorMessage: failure)),
      (products) => emit(SearchSuccessState(products: products)),
    );
  }
}
