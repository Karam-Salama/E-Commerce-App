part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class BannersLoadingState extends HomeState {}

class BannersSuccessState extends HomeState {
  final List<BannerModel> banners;

  BannersSuccessState({required this.banners});
}

class BannersFailureState extends HomeState {
  final String errorMessage;

  BannersFailureState({required this.errorMessage});
}