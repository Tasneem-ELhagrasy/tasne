import 'package:chef/core/local/app_local.dart';
import 'package:chef/core/routes/app_routes.dart';
import 'package:chef/core/uitls/app_assets.dart';

import 'package:chef/core/uitls/app_string.dart';
import 'package:chef/core/uitls/commends.dart';
import 'package:chef/core/widgets/custom_image.dart';
import 'package:chef/features/auth/presentation/cubit/componanents/screens/chang_longe.dart';
import 'package:chef/features/auth/presentation/cubit/cubit/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/custom_loading_indecator.dart';
import '../../../../../../core/widgets/custom_text_form_fild.dart';
import '../../cubit/login_cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  const CustomImage(
                    imgPath: AppAssets.bg2,
                    w: double.infinity,
                  ),
                  Center(
                      child: Text(AppString.welcomeBack.tr(context),
                          style: Theme.of(context).textTheme.displayLarge)),
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSucssState) {
                      toast(
                          message: AppString.loginSucessfully.tr(context),
                          state: ToastStates.success);
                    }
                    if (state is LoginErrorState) {
                      toast(message: state.message, state: ToastStates.error);
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: BlocProvider.of<LoginCubit>(context).loginKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: BlocProvider.of<LoginCubit>(context)
                                .emailController,
                            hint: AppString.email.tr(context),
                            validate: (data) {
                              if (data!.isEmpty ||
                                  !data.contains('@gmail.com')) {
                                return AppString.pleaseEnterValidEmail
                                    .tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 32.h),
                          CustomTextFormField(
                            controller: BlocProvider.of<LoginCubit>(context)
                                .passwordController,
                            hint: AppString.password.tr(context),
                            isPassword: BlocProvider.of<LoginCubit>(context)
                                .isLoginPasswordShowing,
                            icon:
                                BlocProvider.of<LoginCubit>(context).suffixIcon,
                            suffixiIconOnPressed: () {
                              BlocProvider.of<LoginCubit>(context)
                                  .changeLoginPasswordSuffixIcon();
                            },
                            validate: (data) {
                              if (data!.length < 6 || data.isEmpty) {
                                return AppString.pleaseEnterValidPassword
                                    .tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  navigate(
                                      context: context, route: Routes.sendCode);
                                },
                                child: Text(
                                  AppString.forgetPassword.tr(context),
                                ),
                              ),
                              SizedBox(height: 32.h),
                            ],
                          ),
                          state is LoginLoadingState
                              ? const CustomLoadingIndecator()
                              : CustomButton(
                                  onPressed: () {
                                    if (BlocProvider.of<LoginCubit>(context)
                                        .loginKey
                                        .currentState!
                                        .validate()) {
                                      BlocProvider.of<LoginCubit>(context)
                                          .login();
                                    }
                                  },
                                  text: AppString.signIn.tr(context),
                                ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
