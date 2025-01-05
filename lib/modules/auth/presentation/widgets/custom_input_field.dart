import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool suffixIcon;
  final bool? isDense;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomInputField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.suffixIcon = false,
    this.isDense,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: AppTextStyles.poppins500black14,
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: (widget.obscureText && _obscureText),
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            enabledBorder: getBorderStyle(color: AppColors.lightGrey),
            focusedBorder: getBorderStyle(color: AppColors.primaryColor),
            border: getBorderStyle(color: AppColors.lightGrey),
            isDense: (widget.isDense != null) ? widget.isDense : false,
            hintText: widget.hintText,
            hintStyle: AppTextStyles.poppins400lightGray12,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            suffixIcon: widget.suffixIcon
                ? IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.remove_red_eye
                          : Icons.visibility_off_outlined,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
            suffixIconConstraints: (widget.isDense != null)
                ? const BoxConstraints(maxHeight: 33)
                : null,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          controller: widget.controller,
        ),
      ],
    );
  }
}

OutlineInputBorder getBorderStyle({required Color color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
      color: color,
      width: 1.0,
    ),
  );
}
