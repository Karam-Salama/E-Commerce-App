import 'package:flutter/material.dart';

import '../widgets/SignUp_body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
    static const routeName = '/signup-screen';

   @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SignUpBody());
  }
}