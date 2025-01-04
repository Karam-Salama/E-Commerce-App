import 'package:flutter/material.dart';

import '../widgets/onboarding_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const routeName = '/onboarding-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: OnboardingBody());
  }
}
