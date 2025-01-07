import 'package:ecommerce_app/core/utils/assets.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomHomeBannersItem extends StatelessWidget {
  const CustomHomeBannersItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.9,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          Assets.assetsImagesAppLogo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
