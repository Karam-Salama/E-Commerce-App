import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/widgets/custom_btn.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/build_custom_dialog.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../home/presentation/widgets/custom_home_nav_bar_widget.dart';
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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, AuthState state) {
        checkSignUpStateEitherFailOrSuccess(state, context);
      },
      builder: (BuildContext context, AuthState state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signUpFormKey,
          autovalidateMode: authCubit.SignUpAutoValidateMode,
          child: Column(
            children: [
              //!Sign Up Full Name
              CustomInputField(
                labelText: AppStrings.fullName,
                hintText: AppStrings.enterYourFullName,
                controller: authCubit.signUpFullName,
                keyboardType: TextInputType.name,
                validator: Validation.validateName,
              ),
              const SizedBox(height: 16),
              //!Sign Up Email
              CustomInputField(
                labelText: AppStrings.email,
                hintText: AppStrings.enterYourEmail,
                controller: authCubit.signUpEmail,
                keyboardType: TextInputType.emailAddress,
                validator: Validation.validateEmail,
              ),
              const SizedBox(height: 16),
              //!Sign Up Phone
              CustomInputField(
                labelText: AppStrings.phone,
                hintText: AppStrings.enterYourPhone,
                controller: authCubit.signUpPhone,
                keyboardType: TextInputType.number,
                validator: Validation.validatePhone,
              ),

              const SizedBox(height: 16),
              //!Sign Up Password
              CustomInputField(
                labelText: AppStrings.password,
                hintText: AppStrings.enterYourPassword,
                obscureText: true,
                suffixIcon: true,
                controller: authCubit.signUpPassword,
                keyboardType: TextInputType.text,
                validator: Validation.validatePassword,
              ),
              const SizedBox(height: 24),
              //!Sign Up Button
              state is SignUpLoading
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomButton(
                      text: AppStrings.createAccount,
                      onPressed: () async {
                        if (authCubit.signUpFormKey.currentState!.validate()) {
                          authCubit.signUpFormKey.currentState!.save();
                          await context.read<AuthCubit>().signUp();
                        } else {
                          setState(() {
                            authCubit.SignUpAutoValidateMode =
                                AutovalidateMode.always;
                          });
                        }
                      },
                      style: AppTextStyles.Poppins700white14,
                      backGroundColor: AppColors.black,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
              const SizedBox(height: 50),
            ],
          ),
        );
      },
    );
  }

  void checkSignUpStateEitherFailOrSuccess(
      AuthState state, BuildContext context) {
    if (state is SignUpSuccess) {
      buildCustomDialog(
        context,
        CustomDialog(
          icon: Icons.check_circle,
          message: state.message,
          textButton: AppStrings.ok,
          onpressed: () {
            customReplacementNavigate(context,HomeNavBarWidget.routeName);
          },
        ),
      );
    } else if (state is SignUpFailure) {
      buildCustomDialog(
        context,
        CustomDialog(
          icon: Icons.error,
          message: state.errMessage,
          textButton: AppStrings.tryAgain,
          onpressed: () {
            Navigator.pop(context);
          },
        ),
      );
    }
  }
}
