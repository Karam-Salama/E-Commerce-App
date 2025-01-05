import '../../../../core/api/end_ponits.dart';
import 'sign_up_data_model.dart';

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
