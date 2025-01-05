import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/build_custom_dialog.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../cubit/auth_cubit.dart';
import 'custom_input_field.dart';

class CustomSignInForm extends StatefulWidget {
  const CustomSignInForm({super.key});

  @override
  State<CustomSignInForm> createState() => _CustomSignInFormState();
}

class _CustomSignInFormState extends State<CustomSignInForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, AuthState state) {
        checkSignInStateEitherFailOrSuccess(state, context);
      },
      builder: (BuildContext context, AuthState state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signInFormKey,
          autovalidateMode: authCubit.SignInAutoValidateMode,
          child: Column(
            children: [
              //!Sign In Email
              CustomInputField(
                labelText: AppStrings.email,
                hintText: AppStrings.enterYourEmail,
                controller: authCubit.signInEmail,
                keyboardType: TextInputType.emailAddress,
                validator: Validation.validateEmail,
              ),
              const SizedBox(height: 16),
              //!Sign In Password
              CustomInputField(
                labelText: AppStrings.password,
                hintText: AppStrings.enterYourPassword,
                obscureText: true,
                suffixIcon: true,
                controller: authCubit.signInPassword,
                keyboardType: TextInputType.text,
                validator: Validation.validatePassword,
              ),
              const SizedBox(height: 24),
              //!Sign In Button
              state is SignInLoading
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomButton(
                      text: AppStrings.login,
                      onPressed: () async {
                        if (authCubit.signInFormKey.currentState!.validate()) {
                          authCubit.signInFormKey.currentState!.save();
                          await context.read<AuthCubit>().signIn();
                        } else {
                          setState(() {
                            authCubit.SignInAutoValidateMode =
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

  void checkSignInStateEitherFailOrSuccess(
      AuthState state, BuildContext context) {
    if (state is SignInSuccess) {
      buildCustomDialog(
        context,
        CustomDialog(
          icon: Icons.check_circle,
          message: state.message,
          textButton: AppStrings.ok,
          onpressed: () {
            customReplacementNavigate(context, HomeScreen.routeName);
          },
        ),
      );
    } else if (state is SignInFailure) {
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
