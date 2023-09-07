import 'package:chatapp/core/utils/app_assests.dart';
import 'package:chatapp/core/utils/app_colors.dart';
import 'package:chatapp/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.image3,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // signin
              Text(
                AppStrings.signin,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.black,
                ),
              ),
              SizedBox(
                width: 70,
              ),
              //  signup
              Text(
                AppStrings.signUp,
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.primary,
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: AppColors.primary,
                          ),
                          hintText: AppStrings.name,
                          hintStyle:
                              TextStyle(fontSize: 20, color: AppColors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primary),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextField(
                      obscureText: false,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.phone_outlined,
                            color: AppColors.primary,
                          ),
                          hintText: AppStrings.phoneNumber,
                          hintStyle:
                              TextStyle(fontSize: 20, color: AppColors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primary),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextField(
                      obscureText: false,
                      style: TextStyle(fontSize: 20, color: AppColors.black),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: AppColors.primary,
                          ),
                          hintText: AppStrings.email,
                          hintStyle:
                              TextStyle(fontSize: 20, color: AppColors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primary),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextField(
                      obscureText: true,
                      style: TextStyle(color: AppColors.black),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: AppColors.primary,
                          ),
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: AppColors.primary,
                          ),
                          hintText: AppStrings.password,
                          hintStyle:
                              TextStyle(fontSize: 20, color: AppColors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primary),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => const MenuPage()));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: AppColors.primary),
                        child: const Text(
                          AppStrings.signUp,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
