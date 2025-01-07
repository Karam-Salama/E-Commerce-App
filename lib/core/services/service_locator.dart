import 'package:dio/dio.dart';
import 'package:ecommerce_app/modules/auth/data/repos/auth_repo_implem.dart';
import 'package:get_it/get_it.dart';

import '../../modules/auth/domain/repos/auth_repo.dart';
import '../../modules/home/data/repos/home_repo_implment.dart';
import '../../modules/home/domain/repos/home_repo.dart';
import '../api/api_consumer.dart';
import '../api/dio_consumer.dart';
import '../cache/cache_helper.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiConsumer>(DioConsumer(dio: getIt<Dio>()));
  getIt.registerSingleton<AuthRepo>(AuthRepoImplem(api: getIt<ApiConsumer>()));
  getIt.registerSingleton<HomeRepo>(HomeRepoImplment(api: getIt<ApiConsumer>()));
    
}
