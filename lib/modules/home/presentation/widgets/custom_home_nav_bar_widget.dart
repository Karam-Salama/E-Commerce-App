import 'package:ecommerce_app/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/colors.dart';
import '../../../cart/screens/cart_screen.dart';
import '../../../categories/screens/categories_screen.dart';
import '../../../favorite/screens/favorite_screen.dart';
import '../../../setting/screens/profile_screen.dart';
import '../screens/home_screen.dart';

class HomeNavBarWidget extends StatelessWidget {
  HomeNavBarWidget({super.key});

  static const routeName = 'Home_Nav_Bar_Widget';

  final PersistentTabController _controller = PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      padding: const EdgeInsets.symmetric(vertical: 15),
      navBarStyle: NavBarStyle.style6,
      confineToSafeArea: true,
      navBarHeight: 80,
      decoration: NavBarDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            spreadRadius: 0,
            blurRadius: 25,
            offset: const Offset(0, -2),
          ),
        ],
        colorBehindNavBar: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return const [
      HomeScreen(),
      CategoriesScreen(),
      CartScreen(),
      FavoriteScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.assetsVectorsActiveHome),
        inactiveIcon: SvgPicture.asset(Assets.assetsVectorsHome),
        title: AppStrings.home,
        activeColorPrimary: AppColors.black,
        inactiveColorPrimary: AppColors.darkGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.assetsVectorsActiveCategory),
        inactiveIcon: SvgPicture.asset(Assets.assetsVectorsCategory),
        title: AppStrings.categories,
        activeColorPrimary: AppColors.black,
        inactiveColorPrimary: AppColors.darkGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.assetsVectorsActiveCart),
        inactiveIcon: SvgPicture.asset(Assets.assetsVectorsCart),
        title: AppStrings.cart,
        activeColorPrimary: AppColors.black,
        inactiveColorPrimary: AppColors.darkGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.assetsVectorsActiveHeart),
        inactiveIcon: SvgPicture.asset(Assets.assetsVectorsHeart),
        title: AppStrings.wishlist,
        activeColorPrimary: AppColors.black,
        inactiveColorPrimary: AppColors.darkGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.assetsVectorsActiveProfile),
        inactiveIcon: SvgPicture.asset(Assets.assetsVectorsProfile),
        title: AppStrings.profile,
        activeColorPrimary: AppColors.black,
        inactiveColorPrimary: AppColors.darkGrey,
      ),
    ];
  }
}
