// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../modules/onboarding/screens/onboarding_screen.dart';
import '../../modules/splash/screens/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case OnboardingScreen.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingScreen());
    

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
