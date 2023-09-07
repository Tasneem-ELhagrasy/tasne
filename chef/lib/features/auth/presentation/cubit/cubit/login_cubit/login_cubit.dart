import 'package:chef/core/database/api/end_points.dart';
import 'package:chef/core/database/cache/cache_helper.dart';
import 'package:chef/features/auth/data/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/service/service_locator.dart';
import '../../../../data/repodatry/auth_repodatry.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repo) : super(LoginInitial());
  final AuthRepodatry repo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoginPasswordShowing = true;
  IconData suffixIcon = Icons.visibility;
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordShowing = !isLoginPasswordShowing;
    suffixIcon =
        isLoginPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeLoginPasswordSuffixIcon());
  }

  LoginModel? loginModel;
  void login() async {
    emit(LoginLoadingState());
    final result = await repo.login(
      email: emailController.text,
      password: passwordController.text,
    );

    result.fold(
      (l) => emit(LoginErrorState(l)),
      (r) async {
        loginModel = r;
        await sl<CacheHelper>().saveData(
          key: ApiKeys.token,
          value: r.token,
        );
        emit(LoginSucssState());
      },
    );
  }
}
