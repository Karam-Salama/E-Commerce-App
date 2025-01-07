import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/modules/home/domain/repos/home_repo.dart';
import 'package:meta/meta.dart';

import '../../data/models/banner_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  void getBannersData() async {
    emit(BannersLoadingState());
    final response = await homeRepo.getBannersData();
    response.fold(
      (failure) => emit(BannersFailureState(errorMessage: failure)),
      (banners) => emit(BannersSuccessState(banners: banners)),
    );
  }
}
