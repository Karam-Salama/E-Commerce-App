import 'package:flutter/material.dart';

class CustomHomeBannersItem extends StatelessWidget {
  final String imageUrl;

  const CustomHomeBannersItem({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.of(context).size.width;
    return Container(
      width: itemWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.hardEdge,
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
