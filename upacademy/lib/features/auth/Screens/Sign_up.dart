import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upacademy/core/utils/app_color.dart';
import 'package:upacademy/core/utils/app_images.dart';
import 'package:upacademy/core/utils/app_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        // image
        SizedBox(
            height: 300, width: 361.36, child: Image.asset(AppImages.imgpath4)),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // signin
            Text(
              AppStrings.signin,
              style: GoogleFonts.poppins(color: AppColor.lastColor),
            ),
            SizedBox(
              width: 369,
              height: 35,
            ),
            // signup
            Text(
              AppStrings.signup,
              style: GoogleFonts.poppins(color: AppColor.primaryColor),
            )
          ],
        ),

        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.person_outline),
                  hintText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.phone_outlined),
                  hintText: 'Phone Number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: 'E-mail',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: Icon(Icons.visibility_off),
                  hintText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
                  hintText: 'Department',
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: AppColor.primaryColor),
                child: const Text(
                  AppStrings.signup,
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
