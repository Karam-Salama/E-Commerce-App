import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/cache/cache_helper.dart';
import '../../../core/functions/navigation.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/const.dart';
import '../../../core/utils/strings.dart';
import '../../../core/utils/text_style.dart';
import '../../auth/presentation/screens/signUp_screen.dart';
import '../../onboarding/screens/onboarding_screen.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();

    bool onboardingVisited = getIt<CacheHelper>().getData(key: AppConstants.onboardingVisited) ?? false;
    if (onboardingVisited) {
      delayedNavigate(SignupScreen.routeName);
    } else {
      delayedNavigate(OnboardingScreen.routeName);
    }
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
                  child: SvgPicture.asset(Assets.assetsVectorsLogo),
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

  void delayedNavigate(String routeName) {
    Future.delayed(const Duration(seconds: 2), () {
      customReplacementNavigate(context, routeName);
    });
  }
}
