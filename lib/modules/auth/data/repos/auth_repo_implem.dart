import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/sign_up_model.dart';

class AuthRepoImplem extends AuthRepo {
  final ApiConsumer api;

  AuthRepoImplem({required this.api});

  // @override
  // Future<Either<String, SignInModel>> signIn({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //   final response = await api.post(
  //     EndPoint.signIn,
  //     data: {
  //       ApiKey.email: email,
  //       ApiKey.password: password,
  //     },
  //   );
  //   final user = SignInModel.fromJson(response);
  //   CacheHelper().saveData(key: ApiKey.token, value: user.token);
  //   CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
  //   return Right(user);
  // } on ServerException catch (e) {
  //   return Left(e.errModel.errorMessage);
  // }
  // }

  @override
  Future<Either<String, SignUpModel>> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signUp,
        isFromData: true,
        data: {
          ApiKey.name: name,
          ApiKey.email: email,
          ApiKey.phone: phone,
          ApiKey.password: password,
          ApiKey.image: '',
        },
      );
      final signUPModel = SignUpModel.fromJson(response);
      return Right(signUPModel);
    } on ServerException catch (e) {
      log('Exception in AuthRepoImplementation.signUp method:  ${e.toString()}');
      return Left(ServerException(errModel: e.errModel).toString());
    }
  }
}
