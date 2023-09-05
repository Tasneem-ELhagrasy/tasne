import 'package:chef/core/local/app_local.dart';
import 'package:chef/core/uitls/app_assets.dart';

import 'package:chef/core/uitls/app_string.dart';
import 'package:chef/core/widgets/custom_image.dart';
import 'package:chef/features/auth/presentation/cubit/componanents/screens/chang_longe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/custom_text_form_fild.dart';

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
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: TextEditingController(),
                      hint: AppString.email.tr(context),
                    ),
                    SizedBox(height: 32.h),
                    CustomTextFormField(
                      controller: TextEditingController(),
                      hint: AppString.password.tr(context),
                      isPassword: true,
                      icon: Icons.remove_red_eye,
                      suffixiIconOnPressed: () {},
                      validate: (data) {
                        if (data!.length < 6 || data.isEmpty) {
                          return AppString.pleaseEnterValidPassword.tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Text(
                          AppString.forgetPassword.tr(context),
                        ),
                        SizedBox(height: 32.h),
                        CustomButton(
                          onPressed: () {},
                          text: AppString.signIn.tr(context),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
