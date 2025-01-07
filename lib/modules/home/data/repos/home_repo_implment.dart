import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';

import 'package:ecommerce_app/modules/home/data/models/banner_model.dart';

import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/repos/home_repo.dart';

class HomeRepoImplment extends HomeRepo {
  final ApiConsumer api;

  HomeRepoImplment({required this.api});
  @override
  Future<Either<String, List<BannerModel>>> getBannersData() async {
    try {
      final response = await api.get(EndPoint.banners);
      final List<dynamic> data = response[ApiKey.data];
      return Right(data.map((x) => BannerModel.fromJson(x)).toList());
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
