import 'package:chef/core/local/app_local.dart';
import 'package:chef/core/routes/app_routes.dart';
import 'package:chef/core/uitls/app_assets.dart';
import 'package:chef/core/uitls/app_string.dart';
import 'package:chef/core/uitls/commends.dart';
import 'package:chef/core/widgets/custom_image.dart';
import 'package:chef/core/widgets/custom_text_form_fild.dart';
import 'package:chef/features/auth/presentation/cubit/cubit/forget_password_cubit/cubit/forget_password_cubit.dart';
import 'package:chef/features/auth/presentation/cubit/cubit/forget_password_cubit/cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/custom_loading_indecator.dart';
import 'chang_longe.dart';

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.forgetPassword.tr(context),
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
              key: BlocProvider.of<ForgetPasswordCubit>(context).sendCodeKey,
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
                    AppString.sendResetLinkInfo.tr(
                      context,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<ForgetPasswordCubit>(context)
                        .emailController,
                    hint: AppString.email.tr(context),
                    validate: (data) {
                      if (data!.length < 6 || data.isEmpty) {
                        return AppString.pleaseEnterValidPassword.tr(context);
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
