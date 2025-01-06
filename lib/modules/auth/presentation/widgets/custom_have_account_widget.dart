import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({
    super.key,
    required this.textPart1,
    required this.textPart2,
    required this.onPress,
  });

  final String textPart1;
  final String textPart2;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: onPress,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: textPart1, style: AppTextStyles.poppins400darkGrey14),
              const WidgetSpan(
                child: SizedBox(width: 4),
              ),
              TextSpan(
                  text: textPart2,
                  style: AppTextStyles.poppins400primaryColor14),
            ],
          ),
        ),
      ),
    );
  }
}
