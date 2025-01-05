import 'package:ecommerce_app/modules/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            backgroundColor: AppColors.primaryColor,
            centerTitle: true,
            title: const Text("Home Screen"),
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () async {
                  await context.read<AuthCubit>().signOut();
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.logout_outlined,
                  color: AppColors.white,
                ),
              )
            ],
          ),
          body: Center(child: Text("Home")),
        );
      },
    );
  }
}
