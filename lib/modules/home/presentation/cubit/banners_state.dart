part of 'banners_cubit.dart';

@immutable
sealed class BannersState {}

class BannersInitial extends BannersState {}

class BannersLoadingState extends BannersState {}

class BannersSuccessState extends BannersState {
  final List<BannerModel> banners;
  BannersSuccessState({required this.banners});
}

class BannersFailureState extends BannersState {
  final String errorMessage;
  BannersFailureState({required this.errorMessage});
}
