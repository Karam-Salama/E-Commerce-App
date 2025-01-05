import '../../../../core/api/end_ponits.dart';

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
