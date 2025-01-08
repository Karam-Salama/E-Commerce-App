import 'package:ecommerce_app/core/api/end_ponits.dart';

class FilteredProductModel {
  final int id;
  final String name;
  final String image;
  final double price;
  final String description;

  FilteredProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  factory FilteredProductModel.fromJson(Map<String, dynamic> json) {
    return FilteredProductModel(
      id: json[ApiKey.id],
      name: json[ApiKey.name],
      image: json[ApiKey.image],
      price: json[ApiKey.price].toDouble(),
      description: json[ApiKey.description],
    );
  }
}
