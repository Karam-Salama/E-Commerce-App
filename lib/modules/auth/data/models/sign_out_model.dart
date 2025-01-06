// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/core/api/end_ponits.dart';

import 'sign_out_data_model.dart';

class SignOutModel {
  final bool status;
  final String message;
  final SignOutDataModel data;

  SignOutModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SignOutModel.fromJson(Map<String, dynamic> json){
    return SignOutModel(
      status: json[ApiKey.status],
      message: json[ApiKey.message],
      data: SignOutDataModel.fromJson(json[ApiKey.data]),
    );
  }
}
