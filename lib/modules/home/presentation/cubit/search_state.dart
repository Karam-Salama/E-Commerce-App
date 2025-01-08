part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}


class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<FilteredProductModel> products;
  SearchSuccessState({required this.products});
}

class SearchFailureState extends SearchState {
  final String errorMessage;
  SearchFailureState({required this.errorMessage});
}