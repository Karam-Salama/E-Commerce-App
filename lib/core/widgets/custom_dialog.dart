import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_style.dart';
import 'custom_btn.dart';

class CustomDialog extends StatelessWidget {
  final IconData? icon;
  final String message;
  final String textButton;
  final VoidCallback? onpressed;

  const CustomDialog({
    super.key,
    required this.message,
    this.icon,
    required this.textButton,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppColors.primaryColor,
            size: 60,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: AppTextStyles.Poppins700black14.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          CustomButton(
            style: AppTextStyles.Poppins700black14.copyWith(
                color: AppColors.white),
            mainAxisAlignment: MainAxisAlignment.center,
            text: textButton,
            backGroundColor: AppColors.primaryColor,
            onPressed: onpressed!,
          ),
        ],
      ),
    );
  }
}
