import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/strings.dart';

class PageViewItemWidget extends StatelessWidget {
  const PageViewItemWidget({
    super.key,
    required this.image,
    required this.subTitleImage,
    required this.titleImage,
    required this.isVisible,
    this.onPress,
  });
  final String image;
  final String subTitleImage;
  final String titleImage;
  final bool isVisible;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width * 0.7,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 25,
                right: 25,
                child: Visibility(
                  visible: isVisible,
                  child: InkWell(
                    onTap: onPress,
                    child: Text(
                      AppStrings.onboardingSkipText,
                      style: AppTextStyles.poppins400primaryColor14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        SvgPicture.asset(
          titleImage,
          width: MediaQuery.of(context).size.width * 0.6,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 16),
        SvgPicture.asset(
          subTitleImage,
          width: MediaQuery.of(context).size.width * 0.7,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
