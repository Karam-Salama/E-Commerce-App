import 'package:ecommerce_app/core/api/end_ponits.dart';

import 'sign_In_data_model.dart';

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
