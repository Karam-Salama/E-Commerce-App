import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppTextStyles {
  static TextStyle poppins400darkGrey14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: "Poppins",
    color: AppColors.darkGrey,
  );
  static TextStyle poppins400primaryColor14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: "Poppins",
    color: AppColors.primaryColor,
  );
  static TextStyle Poppins700white16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: "Poppins",
    color: AppColors.white,
  );
}
