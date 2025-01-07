import 'package:dartz/dartz.dart';

import '../../data/models/banner_model.dart';

abstract class HomeRepo {
  Future<Either<String, List<BannerModel>>> getBannersData();
}
