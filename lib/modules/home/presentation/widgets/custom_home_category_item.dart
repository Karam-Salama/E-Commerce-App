import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class CustomHomeCategoryItem extends StatelessWidget {
  const CustomHomeCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.2,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.lightGrey, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home,
            color: AppColors.primaryColor,
          ),
          SizedBox(height: size.height * 0.00),
          Text(
            'Category',
            style: TextStyle(
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
