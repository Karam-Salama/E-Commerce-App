import 'package:dartz/dartz.dart';

import '../../data/models/banner_model.dart';
import '../../data/models/category_model.dart';
import '../../data/models/product_model.dart';

abstract class HomeRepo {
  Future<Either<String, List<BannerModel>>> getBannersData();
  Future<Either<String, List<CategoryModel>>> getCategoriesData();
  Future<Either<String, List<ProductModel>>> getProsucts();

}
