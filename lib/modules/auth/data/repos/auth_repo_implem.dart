// import 'package:dartz/dartz.dart';

// import 'package:ecommerce_app/modules/auth/data/models/sign_In_model.dart';

// import 'package:ecommerce_app/modules/auth/data/models/sign_up_model.dart';

// import '../../../../core/api/api_consumer.dart';
// import '../../domain/repos/auth_repo.dart';

// class AuthRepoImplem extends AuthRepo {
//   final ApiConsumer api;

//   AuthRepoImplem({required this.api});

//   @override
//   Future<Either<String, SignInModel>> signIn({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final response = await api.post(
//         EndPoint.signIn,
//         data: {
//           ApiKey.email: email,
//           ApiKey.password: password,
//         },
//       );
//       final user = SignInModel.fromJson(response);
//       final decodedToken = JwtDecoder.decode(user.token);
//       CacheHelper().saveData(key: ApiKey.token, value: user.token);
//       CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
//       return Right(user);
//     } on ServerException catch (e) {
//       return Left(e.errModel.errorMessage);
//     }
//   }

//   @override
//   Future<Either<String, SignUpModel>> signUp({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final response = await api.post(
//         EndPoint.signUp,
//         isFromData: true,
//         data: {
//           ApiKey.name: name,
//           ApiKey.phone: phone,
//           ApiKey.email: email,
//           ApiKey.password: password,
//           ApiKey.confirmPassword: confirmPassword,
//           ApiKey.location:
//               '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
//           ApiKey.profilePic: await uploadImageToAPI(profilePic)
//         },
//       );
//       final signUPModel = SignUpModel.fromJson(response);
//       return Right(signUPModel);
//     } on ServerException catch (e) {
//       return Left(e.errModel.errorMessage);
//     }
//   }
// }

