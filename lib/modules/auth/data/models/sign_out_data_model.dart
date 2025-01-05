
import '../../../../core/api/end_ponits.dart';

class SignOutDataModel {
  int id;
  String token;
  SignOutDataModel({
    required this.id,
    required this.token,
  });

  factory SignOutDataModel.fromJson(Map<String, dynamic> jsonData){
    return SignOutDataModel(
      id: jsonData[ApiKey.id],
      token: jsonData[ApiKey.token],
    );
  }
}
