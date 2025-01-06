import 'package:ecommerce_app/modules/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../domain/repos/auth_repo.dart';
import '../widgets/SignUp_body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  static const routeName = '/signup-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(getIt<AuthRepo>()),
        child: SignUpBody(),
      ),
    );
  }
}
