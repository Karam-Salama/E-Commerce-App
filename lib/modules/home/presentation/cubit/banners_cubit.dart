import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/banner_model.dart';
import '../../domain/repos/home_repo.dart';

part 'banners_state.dart';


class BannersCubit extends Cubit<BannersState> {
  final HomeRepo homeRepo;

  BannersCubit(this.homeRepo) : super(BannersInitial());

  void getBannersData() async {
    emit(BannersLoadingState());
    final response = await homeRepo.getBannersData();
    response.fold(
      (failure) => emit(BannersFailureState(errorMessage: failure)),
      (banners) => emit(BannersSuccessState(banners: banners)),
    );
  }
}
