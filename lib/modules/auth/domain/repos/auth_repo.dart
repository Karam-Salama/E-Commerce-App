import 'package:dartz/dartz.dart';

import '../../data/models/sign_up_model.dart';

abstract class AuthRepo {
  // Future<Either<String, SignInModel>> signIn({
  //   required String email,
  //   required String password,
  // });

  Future<Either<String, SignUpModel>> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  });
}
