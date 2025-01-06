import 'package:ecommerce_app/modules/auth/presentation/screens/signIn_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/custom_header_text.dart';
import 'custom_auth_logo_widget.dart';
import 'custom_have_account_widget.dart';
import 'custom_sign_up_form_widget.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 44)),
          const SliverToBoxAdapter(child: CustomAuthLogo()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: CustomHeaderText(text1: AppStrings.signup)),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          //! Dont Have An Account ?
          SliverToBoxAdapter(
            child: HaveAccountWidget(
              textPart1: AppStrings.alreadyHaveAccount,
              textPart2: AppStrings.login,
              onPress: () {
                customReplacementNavigate(context, SigninScreen.routeName);
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
          //! SignUp Form
          const SliverToBoxAdapter(child: CustomSignUpForm()),
        ],
      ),
    );
  }
}
