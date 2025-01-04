import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/validation.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/utils/text_style.dart';
import '../cubit/auth_cubit.dart';
import 'custom_input_field.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().signUpFormKey,
      autovalidateMode: context.read<AuthCubit>().SignUpAutoValidateMode,
      child: Column(
        children: [
          //!Sign Up Full Name
          CustomInputField(
            labelText: AppStrings.fullName,
            hintText: AppStrings.enterYourFullName,
            controller: context.read<AuthCubit>().signUpFullName,
            keyboardType: TextInputType.name,
            validator: Validation.validateName,
          ),
          const SizedBox(height: 16),
          //!Sign Up Email
          CustomInputField(
            labelText: AppStrings.email,
            hintText: AppStrings.enterYourEmail,
            controller: context.read<AuthCubit>().signUpEmail,
            keyboardType: TextInputType.emailAddress,
            validator: Validation.validateEmail,
          ),
          const SizedBox(height: 16),
          //!Sign Up Password
          CustomInputField(
            labelText: AppStrings.password,
            hintText: AppStrings.enterYourPassword,
            obscureText: true,
            suffixIcon: true,
            controller: context.read<AuthCubit>().signUpPassword,
            keyboardType: TextInputType.text,
            validator: Validation.validatePassword,
          ),
          const SizedBox(height: 24),
          //!Sign Up Button
          CustomButton(
            text: AppStrings.login,
            onPressed: () {},
            style: AppTextStyles.Poppins700white14,
            backGroundColor: AppColors.black,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
