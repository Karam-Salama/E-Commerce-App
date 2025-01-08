import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/modules/home/data/models/product_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/repos/home_repo.dart';
import '../models/banner_model.dart';
import '../models/category_model.dart';
import '../models/filtered_product_model.dart';

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

  @override
  Future<Either<String, List<CategoryModel>>> getCategoriesData() async {
    try {
      final response = await api.get(EndPoint.categories);
      final List<dynamic> data = response[ApiKey.data][ApiKey.data];
      return Right(data.map((x) => CategoryModel.fromJson(x)).toList());
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getProductsInHome() async {
    try {
      final response = await api.get(EndPoint.home);
      final List<dynamic> data = response[ApiKey.data][ApiKey.products];
      return Right(data.map((x) => ProductModel.fromJson(x)).toList());
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  @override
  Future<Either<String, List<FilteredProductModel>>> getProductsBySearch({
    required String productName,
  }) async {
    try {
      final response = await api.post(
        EndPoint.search,
        data: {ApiKey.text: productName},
      );
      final List<dynamic> data = response[ApiKey.data][ApiKey.data];
      return Right(data.map((x) => FilteredProductModel.fromJson(x)).toList());
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  @override
Future<Either<String, ProductModel>> getFavoritesProducts({
  required int productId,
}) async {
  try {
    final response = await api.post(
      EndPoint.favorites,
      data: {ApiKey.productId: productId},
    );
    final ProductModel data = ProductModel.fromJson(response[ApiKey.data]);
    return Right(data);
  } on ServerException catch (e) {
    return Left(e.errModel.errorMessage);
  }
}

}
