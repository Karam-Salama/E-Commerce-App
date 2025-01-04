import 'package:flutter/material.dart';

import '../core/functions/onGenerate_routes.dart';
import '../core/utils/colors.dart';
import '../modules/splash/screens/splash_screen.dart';

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}
