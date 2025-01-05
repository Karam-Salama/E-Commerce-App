import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/models/sign_In_model.dart';
import '../../domain/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  AutovalidateMode SignInAutoValidateMode = AutovalidateMode.disabled;

  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();

  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  AutovalidateMode SignUpAutoValidateMode = AutovalidateMode.disabled;

  //Sign up name
  TextEditingController signUpFullName = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  // Sign up phone
  TextEditingController signUpPhone = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  SignInModel? user;

  signUp() async {
    emit(SignUpLoading());
    final response = await authRepo.signUp(
      name: signUpFullName.text,
      email: signUpEmail.text,
      phone: signUpPhone.text,
      password: signUpPassword.text,
    );
    response.fold(
      (errorMessage) => emit(SignUpFailure(errMessage: errorMessage)),
      (signUpModel) => emit(SignUpSuccess(message: signUpModel.message)),
    );
  }

  signIn() async {
    emit(SignInLoading());
    // final response = await authRepo.signIn(
    //   email: signInEmail.text,
    //   password: signInPassword.text,
    // );
    // response.fold(
    //   (errorMessage) => emit(SignInFailure(errMessage: errorMessage)),
    //   (signInModel) => emit(SignInSuccess()),
    // );
  }
}
