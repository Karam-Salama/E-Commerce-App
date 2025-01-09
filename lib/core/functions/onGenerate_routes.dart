// ignore_for_file: file_names

import 'package:ecommerce_app/modules/categories/screens/categories_screen.dart';
import 'package:flutter/material.dart';

import '../../modules/auth/presentation/screens/signIn_screen.dart';
import '../../modules/auth/presentation/screens/signUp_screen.dart';
import '../../modules/cart/screens/cart_screen.dart';
import '../../modules/favorite/screens/favorite_screen.dart';
import '../../modules/home/presentation/screens/home_screen.dart';
import '../../modules/home/presentation/widgets/custom_home_nav_bar_widget.dart';
import '../../modules/onboarding/screens/onboarding_screen.dart';
import '../../modules/setting/screens/profile_screen.dart';
import '../../modules/splash/screens/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case OnboardingScreen.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingScreen());
    case SignupScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SignupScreen());
    case SigninScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SigninScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case FavoriteScreen.routeName:
      return MaterialPageRoute(builder: (context) => const FavoriteScreen());
    case CategoriesScreen.routeName:
      return MaterialPageRoute(builder: (context) => const CategoriesScreen());
    case CartScreen.routeName:
      return MaterialPageRoute(builder: (context) => const CartScreen());
    case ProfileScreen.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileScreen());

    case HomeNavBarWidget.routeName:
      return MaterialPageRoute(builder: (context) => HomeNavBarWidget());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
