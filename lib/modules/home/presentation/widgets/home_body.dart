import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/custom_header_text.dart';
import 'custom_home_banners.dart';
import 'custom_home_categories.dart';
import 'custom_home_header.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: size.width * 0.05)),
          const SliverToBoxAdapter(child: CustomHomeHeader()),
          SliverToBoxAdapter(child: SizedBox(height: size.width * 0.05)),
          SliverToBoxAdapter(child: CustomHomeBannersList()),
          SliverToBoxAdapter(child: SizedBox(height: size.width * 0.05)),
          SliverToBoxAdapter(
            child: CustomHeaderText(
              text1: AppStrings.categories,
              text2: AppStrings.seeAll,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: size.width * 0.05)),
          SliverToBoxAdapter(child: CustomHomeCategoriesList(itemCount: 6)),
          SliverToBoxAdapter(child: SizedBox(height: size.width * 0.05)),
          SliverToBoxAdapter(
            child: CustomHeaderText(
              text1: AppStrings.latestProducts,
              text2: AppStrings.seeAll,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: size.width * 0.05)),
          SliverToBoxAdapter(child: CustomHomeProductsList()),
          SliverToBoxAdapter(child: SizedBox(height: size.width * 0.05)),
        ],
      ),
    );
  }
}

class CustomHomeProductsList extends StatelessWidget {
  const CustomHomeProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemBuilder: (context, index) => CustomProductsCard(),
    );
  }
}

class CustomProductsCard extends StatelessWidget {
  const CustomProductsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}
