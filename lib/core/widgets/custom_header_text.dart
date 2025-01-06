// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_style.dart';

class CustomHeaderText extends StatelessWidget {
  CustomHeaderText({
    super.key,
    required this.text1,
    this.styleText1,
    this.textAlign1,
    this.onpress1,
    this.text2,
    this.textAlign2,
    this.onpress2,
  });

  final String text1;
  final VoidCallback? onpress1;
  final VoidCallback? onpress2;
  final String? text2;
  final TextAlign? textAlign1;
  final TextAlign? textAlign2;
  final TextStyle? styleText1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: InkWell(
            onTap: onpress1,
            child: Text(
              text1,
              style: styleText1 ?? AppTextStyles.Poppins700black24,
              textAlign: textAlign1 ?? TextAlign.start,
            ),
          ),
        ),
        if (text2 != null)
          Expanded(
            child: InkWell(
              splashColor: AppColors.primaryColor.withOpacity(0.3),
              highlightColor: AppColors.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
              onTap: onpress2,
              child: Text(
                text2!,
                style: AppTextStyles.poppins700primaryColor10,
                textAlign: textAlign2,
              ),
            ),
          ),
      ],
    );
  }
}
