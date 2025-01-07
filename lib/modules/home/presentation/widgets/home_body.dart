import 'package:flutter/material.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/custom_header_text.dart';
import 'custom_home_banners.dart';
import 'custom_home_categories.dart';
import 'custom_home_header.dart';
import 'custom_home_products_list.dart';

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
              onpress2: () {},
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: size.width * 0.05)),
          SliverToBoxAdapter(child: CustomHomeCategoriesList()),
          SliverToBoxAdapter(child: SizedBox(height: size.width * 0.05)),
          SliverToBoxAdapter(
            child: CustomHeaderText(
              text1: AppStrings.latestProducts,
              text2: AppStrings.seeAll,
              onpress2: () {},
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
