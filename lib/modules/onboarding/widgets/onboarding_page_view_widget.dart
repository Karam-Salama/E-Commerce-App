import 'package:flutter/material.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/functions/navigation.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/const.dart';
import '../../auth/presentation/screens/signUp_screen.dart';
import 'page_view_item_widget.dart';

class OnboardingPageViewWidget extends StatelessWidget {
  const OnboardingPageViewWidget({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        controller: pageController,
        children: [
          PageViewItemWidget(
            isVisible: true,
            onPress: () {
              getIt<CacheHelper>()
                  .saveData(key: AppConstants.onboardingVisited, value: true);
              customReplacementNavigate(context, SignupScreen.routeName);
            },
            image: Assets.assetsImagesOnboardingImage1,
            titleImage: Assets.assetsVectorsOnboardingTitle1,
            subTitleImage: Assets.assetsVectorsOnboardingSubTitle1,
          ),
          PageViewItemWidget(
            isVisible: true,
            onPress: () {
              getIt<CacheHelper>()
                  .saveData(key: AppConstants.onboardingVisited, value: true);
              customReplacementNavigate(context, SignupScreen.routeName);
            },
            image: Assets.assetsImagesOnboardingImage2,
            titleImage: Assets.assetsVectorsOnboardingTitle2,
            subTitleImage: Assets.assetsVectorsOnboardingSubTitle2,
          ),
          PageViewItemWidget(
            isVisible: false,
            image: Assets.assetsImagesOnboardingImage3,
            titleImage: Assets.assetsVectorsOnboardingTitle3,
            subTitleImage: Assets.assetsVectorsOnboardingSubTitle3,
          ),
        ],
      ),
    );
  }
}
