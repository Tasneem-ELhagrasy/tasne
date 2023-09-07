import 'package:chatapp/core/utils/app_assests.dart';
import 'package:chatapp/featuers/auth/presentation/sign_up/sign_up.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // ignore: unused_element
  void _login() {
    if (emailController.text == 'tasneemradwan@gmail.com' &&
        passwordController.text == '12345') {
      Navigator.pushNamed(context, '/signup');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid Credentials'),
            content: const Text('Please enter valid name, email and password.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(AppImages.image3),
              const SizedBox(
                height: 50,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // signin
                  Text(
                    AppStrings.signin,
                    style: TextStyle(
                      fontSize: 30,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  //  signup
                  Text(
                    AppStrings.signUp,
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.black,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: AppStrings.email,
                    contentPadding: EdgeInsets.only(left: 15),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: AppStrings.password,
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: Icon(Icons.visibility_off),
                    contentPadding: EdgeInsets.only(left: 15),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: (const Text(AppStrings.forgotPassword)),
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(height: 23.0),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(AppStrings.signin),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
