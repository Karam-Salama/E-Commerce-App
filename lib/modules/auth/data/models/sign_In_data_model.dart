import '../../../../core/api/end_ponits.dart';

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
