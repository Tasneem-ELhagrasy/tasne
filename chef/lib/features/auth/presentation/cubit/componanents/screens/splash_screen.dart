import 'package:chef/core/local/app_local.dart';
import 'package:chef/core/routes/app_routes.dart';
import 'package:chef/core/uitls/app_assets.dart';
import 'package:chef/core/uitls/app_colors.dart';
import 'package:chef/core/uitls/app_string.dart';
import 'package:chef/core/uitls/commends.dart';
import 'package:chef/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    natvigateAfterThreeSeconds();
    super.initState();
  }

  void natvigateAfterThreeSeconds() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      navigate(context: context, route: Routes.changelang);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(imgPath: AppAssets.img1, h: 120.h, w: 120.w),
            SizedBox(
              height: 16.h,
            ),
            Text(AppString.chefApp.tr(context),
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: AppColors.black,
                      fontSize: 36,
                    )),
          ],
        ),
      ),
    );
  }
}
