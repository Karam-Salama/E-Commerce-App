import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../core/cache/cache_helper.dart';
import '../../../core/functions/navigation.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/const.dart';
import '../../../core/utils/strings.dart';
import '../../../core/utils/text_style.dart';
import '../../../core/widgets/custom_btn.dart';
import '../../auth/presentation/screens/signUp_screen.dart';
import 'onboarding_page_view_widget.dart';

//* steps of logic
//* scroll controller
//* listen pageView
//* update currentPage

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: OnboardingPageViewWidget(
              pageController: pageController,
            ),
          ),
          DotsIndicator(
            dotsCount: 3,
            position: currentPage,
            decorator: DotsDecorator(
              color: AppColors.dotsIndicatorColor,
              activeColor: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Visibility(
              visible: currentPage == 2 ? true : false,
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              child: CustomButton(
                text: AppStrings.onboardingGetStartedText,
                style: AppTextStyles.Poppins700white14,
                mainAxisAlignment: MainAxisAlignment.center,
                backGroundColor: AppColors.black,
                onPressed: () {
                  getIt<CacheHelper>()
                      .saveData(key: AppConstants.onboardingVisited, value: true);
                  customReplacementNavigate(context, SignupScreen.routeName);
                },
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05)
        ],
      ),
    );
  }
}
