
import 'package:flutter/material.dart';

import '../../modules/auth/presentation/widgets/custom_input_field.dart';
import '../utils/colors.dart';
import '../utils/text_style.dart';

class SearchTextFormField extends StatelessWidget {
  final String hintText;
  final bool suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onPressed;
  final TextInputType keyboardType;

  const SearchTextFormField({
    super.key,
    required this.hintText,
    required this.suffixIcon,
    this.controller,
    this.validator,
    this.onPressed,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.poppins400lightGray12,
        enabledBorder: getBorderStyle(color: AppColors.lightGrey),
        focusedBorder: getBorderStyle(color: AppColors.primaryColor),
        border: getBorderStyle(color: AppColors.lightGrey),
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black54,
          ),
          onPressed: onPressed,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
