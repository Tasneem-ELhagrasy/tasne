import 'package:chef/core/bloc/cubit/global_cubit.dart';
import 'package:chef/core/bloc/cubit/global_state.dart';
import 'package:chef/core/local/app_local.dart';
import 'package:chef/core/uitls/app_assets.dart';
import 'package:chef/core/uitls/app_colors.dart';
import 'package:chef/core/uitls/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/custom_image.dart';

class ChangeLongScreen extends StatelessWidget {
  const ChangeLongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            const CustomImage(imgPath: AppAssets.bg1, w: double.infinity),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  SizedBox(
                    height: 116.h,
                  ),
                  CustomImage(imgPath: AppAssets.img1, h: 120.h, w: 120.w),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(AppString.welcomeToChefApp.tr(context),
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: AppColors.black,
                            fontSize: 32,
                          )),
                  SizedBox(
                    height: 54.h,
                  ),
                  Text(AppString.PleaseChooseYourLanguage.tr(context),
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: AppColors.black,
                                fontSize: 24,
                              )),
                  SizedBox(
                    height: 120.h,
                  ),
                  BlocBuilder<GlobalCubit, GlobalState>(
                    builder: (context, state) {
                      return Row(children: [
                        CustomButton(
                          text: 'English',
                          onPressed: () {
                            BlocProvider.of<GlobalCubit>(context)
                                .changeLang('en');
                          },
                          width: 140,
                          background: AppColors.black,
                        ),
                        const Spacer(),
                        CustomButton(
                          text: 'العربيه',
                          onPressed: () {
                            BlocProvider.of<GlobalCubit>(context)
                                .changeLang('ar');
                          },
                          width: 140,
                          background: AppColors.black,
                        )
                      ]);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height = 48,
    this.width = double.infinity,
    required this.onPressed,
    this.background,
    required this.text,
  });
  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final Color? background;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height!.h,
        width: width!.w,
        child: ElevatedButton(
          onPressed: onPressed,
          style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
              backgroundColor:
                  MaterialStateProperty.all(background ?? AppColors.orange)),
          child: Text(
            text,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ));
  }
}
