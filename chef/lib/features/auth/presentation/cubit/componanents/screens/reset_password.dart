import 'package:chef/core/local/app_local.dart';
import 'package:chef/core/widgets/custom_loading_indecator.dart';
import 'package:chef/features/auth/presentation/cubit/componanents/screens/chang_longe.dart';
import 'package:chef/features/auth/presentation/cubit/cubit/forget_password_cubit/cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/uitls/app_assets.dart';
import '../../../../../../core/uitls/app_string.dart';
import '../../../../../../core/uitls/commends.dart';
import '../../../../../../core/widgets/custom_image.dart';
import '../../../../../../core/widgets/custom_text_form_fild.dart';
import '../../cubit/forget_password_cubit/cubit/forget_password_cubit.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.createYourNewPassword.tr(context),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is SendCodeSucssState) {
              toast(
                message: state.message,
                state: ToastStates.success,
              );
              navigate(context: context, route: Routes.restPassword);
            }
          },
          builder: (context, state) {
            return Form(
              key:
                  BlocProvider.of<ForgetPasswordCubit>(context).resetPaswordKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: const CustomImage(imgPath: AppAssets.img2),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    AppString.createYourNewPassword.tr(
                      context,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<ForgetPasswordCubit>(context)
                        .newpasswordController,
                    hint: AppString.newPassword.tr(context),
                    isPassword: BlocProvider.of<ForgetPasswordCubit>(context)
                        .isNewPasswordShowing,
                    icon: BlocProvider.of<ForgetPasswordCubit>(context)
                        .suffixIconNewPassword,
                    suffixiIconOnPressed: () {
                      BlocProvider.of<ForgetPasswordCubit>(context)
                          .changeNewPasswordSuffixIcon();
                    },
                    validate: (data) {
                      if (data!.length < 6 || data.isEmpty) {
                        return AppString.pleaseEnterValidPassword.tr(context);
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<ForgetPasswordCubit>(context)
                        .confirmpasswordController,
                    hint: AppString.confirmPassword.tr(context),
                    isPassword: BlocProvider.of<ForgetPasswordCubit>(context)
                        .isConfirmPasswordShowing,
                    icon: BlocProvider.of<ForgetPasswordCubit>(context)
                        .suffixIconConfirmPassword,
                    suffixiIconOnPressed: () {
                      BlocProvider.of<ForgetPasswordCubit>(context)
                          .changeConfirmPasswordSuffixIcon();
                    },
                    validate: (data) {
                      if (data!.length < 6 || data.isEmpty) {
                        return AppString.pleaseEnterValidPassword.tr(context);
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<ForgetPasswordCubit>(context)
                        .emailController,
                    hint: AppString.code.tr(context),
                    validate: (data) {
                      if (data!.isEmpty) {
                        return AppString.pleaseEnterValidCode.tr(context);
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  state is SendCodeLoadingState
                      ? const CustomLoadingIndecator()
                      : CustomButton(
                          onPressed: () {
                            if (BlocProvider.of<ForgetPasswordCubit>(context)
                                .sendCodeKey
                                .currentState!
                                .validate()) {
                              BlocProvider.of<ForgetPasswordCubit>(context)
                                  .sendCode();
                            }
                          },
                          text: AppString.sendResetLink.tr(context),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
