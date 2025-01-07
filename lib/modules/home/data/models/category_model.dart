import 'package:ecommerce_app/core/api/end_ponits.dart';

class CategoryModel {
  final int id;
  final String name;
  final String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      id: jsonData[ApiKey.id],
      name: jsonData[ApiKey.name],
      image: jsonData[ApiKey.image],
    );
  }
}
