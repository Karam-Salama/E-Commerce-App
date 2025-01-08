import 'package:dartz/dartz.dart';

import '../../data/models/banner_model.dart';
import '../../data/models/category_model.dart';
import '../../data/models/filtered_product_model.dart';
import '../../data/models/product_model.dart';

abstract class HomeRepo {
  // ! Home Data
  Future<Either<String, List<BannerModel>>> getBannersData();
  Future<Either<String, List<CategoryModel>>> getCategoriesData();
  Future<Either<String, List<ProductModel>>> getProductsInHome();
  
  // ! Search Data
  Future<Either<String, List<FilteredProductModel>>> getProductsBySearch({
    required String productName,
  });

  // ! Favorites Data
  Future<Either<String, ProductModel>> getFavoritesProducts({
    required int productId,
  });
}
