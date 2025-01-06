import '../../../../core/api/end_ponits.dart';

//! sign up model
class SignUpModel {
  final bool status;
  final String message;
  final SignUpDataModel data;

  SignUpModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
      status: jsonData[ApiKey.status],
      message: jsonData[ApiKey.message],
      data: SignUpDataModel.fromJson(jsonData[ApiKey.data]),
    );
  }
}


//! sign up data model
class SignUpDataModel {
  final String name;
  final String phone;
  final String email;
  final int id;
  final String image;
  final String token;

  SignUpDataModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.id,
    required this.image,
    required this.token,
  });

  factory SignUpDataModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpDataModel(
      name: jsonData[ApiKey.name],
      phone: jsonData[ApiKey.phone],
      email: jsonData[ApiKey.email],
      id: jsonData[ApiKey.id],
      image: jsonData[ApiKey.image],
      token: jsonData[ApiKey.token],
    );
  }
}
