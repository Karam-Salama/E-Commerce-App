import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../domain/repos/auth_repo.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/signIn_body.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});
  static const routeName = '/signIn-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(getIt<AuthRepo>()),
        child: SignInBody(),
      ),
    );
  }
}
