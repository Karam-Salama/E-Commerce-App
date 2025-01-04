import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/functions/navigation.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/const.dart';
import '../../../core/utils/strings.dart';
import '../../../core/utils/text_style.dart';
import '../../onboarding/screens/onboarding_screen.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      customReplacementNavigate(context, OnboardingScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SvgPicture.asset(Assets.assetsVectorsSplashLogo),
                ),
              ),
              Text(
                AppStrings.developedBy,
                style: AppTextStyles.poppins400darkGrey14,
              ),
              SizedBox(height: height * AppConstants.smallSpacing),
            ],
          ),
        ),
      ],
    );
  }
}
