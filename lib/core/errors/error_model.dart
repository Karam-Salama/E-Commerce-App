import '../api/end_ponits.dart';

class ErrorModel {
  final bool status;
  final String errorMessage;
  final String data;

  ErrorModel(this.data, {required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      jsonData[ApiKey.data],
      status: jsonData[ApiKey.status],
      errorMessage: jsonData[ApiKey.message],
    );
  }
}
