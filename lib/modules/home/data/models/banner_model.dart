import 'package:ecommerce_app/core/api/end_ponits.dart';

class BannerModel {
  final int id;
  final String image;

  BannerModel({
    required this.id,
    required this.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> jsonData) {
    return BannerModel(
      id: jsonData[ApiKey.id], 
      image: jsonData[ApiKey.image],
    );
  }
}

