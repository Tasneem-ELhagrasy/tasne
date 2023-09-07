import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/repodatry/auth_repodatry.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepository) : super(ForgetPasswordInitial());
  final AuthRepodatry authRepository;
  GlobalKey<FormState> sendCodeKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetPaswordKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  void sendCode() async {
    emit(SendCodeLoadingState());
    final res = await authRepository.sendCode(emailController.text);
    res.fold(
        (l) => emit(SendCodeErrorState(l)), (r) => emit(SendCodeSucssState(r)));
  }

  // new password
  TextEditingController newpasswordController = TextEditingController();
  bool isNewPasswordShowing = true;
  IconData suffixIconNewPassword = Icons.visibility;

  void changeNewPasswordSuffixIcon() {
    isNewPasswordShowing = !isNewPasswordShowing;
    suffixIconNewPassword =
        isNewPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeNewPasswordSuffixIcon());
  }

  // confirm password
  TextEditingController confirmpasswordController = TextEditingController();
  bool isConfirmPasswordShowing = true;
  IconData suffixIconConfirmPassword = Icons.visibility;

  void changeConfirmPasswordSuffixIcon() {
    isNewPasswordShowing = !isNewPasswordShowing;
    suffixIconNewPassword =
        isNewPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeConfirmPasswordSuffixIcon());
  }
}
