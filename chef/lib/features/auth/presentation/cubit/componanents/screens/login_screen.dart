import 'package:chef/core/local/app_local.dart';
import 'package:chef/core/uitls/app_assets.dart';

import 'package:chef/core/uitls/app_string.dart';
import 'package:chef/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            )
          ],
        ),
      ),
    );
  }
}
