import 'package:flutter/material.dart';

import '../uitls/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.hint,
      this.lable,
      this.validate,
      this.isPassword = false,
      this.icon,
      this.suffixiIconOnPressed});
  final TextEditingController controller;
  final String? hint;
  final String? lable;
  final String? Function(String?)? validate;
  final bool isPassword;
  final IconData? icon;
  final VoidCallback? suffixiIconOnPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(),
      cursorColor: AppColors.orange,
      obscureText: isPassword,
      validator: validate,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.gray),
        labelText: lable,
        suffixIcon: IconButton(
          onPressed: suffixiIconOnPressed,
          icon: Icon(
            icon,
            color: AppColors.gray,
          ),
        ),
      ),
    );
  }
}
