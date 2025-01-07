import 'package:ecommerce_app/core/api/end_ponits.dart';

class ProductModel {
  final int id;
  final double price;
  final double old_price;
  final double discount;
  final String image;
  final String name;
  final String description;
  final bool in_favorites;
  final bool in_cart;

  ProductModel({
    required this.id,
    required this.price,
    required this.old_price,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.in_favorites,
    required this.in_cart,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      id: json[ApiKey.id].toInt(),
      price: json[ApiKey.price].toDouble(),
      old_price: json[ApiKey.oldPrice].toDouble(),
      discount: json[ApiKey.discount].toDouble(),
      image: json[ApiKey.image],
      name: json[ApiKey.name],
      description: json[ApiKey.description],
      in_favorites: json[ApiKey.inFavorites],
      in_cart: json[ApiKey.inCart],
    );
  }
}
