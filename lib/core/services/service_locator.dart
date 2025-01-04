import 'package:get_it/get_it.dart';

import '../cache/cache_helper.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  
  // getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  // getIt.registerSingleton<DatabaseService>(FirabaseFirestoreService());

  // getIt.registerSingleton<AuthRepo>(
  //   AuthRepoImplement(
  //     firebaseAuthService: getIt<FirebaseAuthService>(),
  //     databaseService:  getIt<DatabaseService>()
  //   ),
  // );
}