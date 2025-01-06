import 'package:ecommerce_app/core/api/end_ponits.dart';

//! sign in model
class SignInModel {
  final bool status;
  final String message;
  final SignInDataModel data;

  SignInModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      status: json[ApiKey.status],
      message: json[ApiKey.message],
      data: SignInDataModel.fromJson(json[ApiKey.data]),
    );
  }
}

//! sign in data model
class SignInDataModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;

  SignInDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  factory SignInDataModel.fromJson(Map<String, dynamic> json) {
    return SignInDataModel(
      id: json[ApiKey.id],
      name: json[ApiKey.name],
      email: json[ApiKey.email],
      phone: json[ApiKey.phone],
      image: json[ApiKey.image],
      points: json[ApiKey.points],
      credit: json[ApiKey.credit],
      token: json[ApiKey.token],
    );
  }
}
