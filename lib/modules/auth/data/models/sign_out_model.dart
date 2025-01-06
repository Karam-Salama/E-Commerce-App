import 'package:ecommerce_app/core/api/end_ponits.dart';

// ! sign out model
class SignOutModel {
  final bool status;
  final String message;
  final SignOutDataModel data;

  SignOutModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SignOutModel.fromJson(Map<String, dynamic> json) {
    return SignOutModel(
      status: json[ApiKey.status],
      message: json[ApiKey.message],
      data: SignOutDataModel.fromJson(json[ApiKey.data]),
    );
  }
}

// ! sign out data model
class SignOutDataModel {
  int id;
  String token;
  SignOutDataModel({
    required this.id,
    required this.token,
  });

  factory SignOutDataModel.fromJson(Map<String, dynamic> jsonData) {
    return SignOutDataModel(
      id: jsonData[ApiKey.id],
      token: jsonData[ApiKey.token],
    );
  }
}
