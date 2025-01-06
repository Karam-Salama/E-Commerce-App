import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/modules/auth/data/models/sign_out_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/sign_In_model.dart';
import '../models/sign_up_model.dart';

class AuthRepoImplem extends AuthRepo {
  final ApiConsumer api;

  AuthRepoImplem({required this.api});

  @override
  Future<Either<String, SignInModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.email: email,
          ApiKey.password: password,
        },
      );
      final user = SignInModel.fromJson(response);
      CacheHelper().saveData(key: ApiKey.token, value: user.data.token);
      CacheHelper().saveData(key: ApiKey.id, value: user.data.id);
      return Right(user);
    } on ServerException catch (e) {
      log('Exception in AuthRepoImplementation.signIn method:  ${e.toString()}');
      return Left(ServerException(errModel: e.errModel).toString());
    }
  }

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

  @override
  Future<Either<String, SignOutModel>> signOut() async{
    try {
      final response = await api.post(
        queryParameters: {
          ApiKey.token: CacheHelper().getData(key: ApiKey.token),
        },
        EndPoint.signOut,
        data: {
          ApiKey.token: CacheHelper().getData(key: ApiKey.token),
        },
      );
      final signOutModel = SignOutModel.fromJson(response);
      return Right(signOutModel);
    } on ServerException catch (e) {
      log('Exception in AuthRepoImplementation.SignOut method:  ${e.toString()}');
      return Left(ServerException(errModel: e.errModel).toString());
    }
  }
}
