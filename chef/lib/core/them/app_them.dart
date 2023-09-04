import 'package:chef/core/uitls/app_text_style.dart';
import 'package:flutter/material.dart';
import '../uitls/app_colors.dart';

ThemeData getAppTheme() {
  return ThemeData(
      primaryColor: AppColors.orange,
      // background color
      scaffoldBackgroundColor: AppColors.white,
      // appBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.orange,
        centerTitle: true,
      ),
      // textTheme
      textTheme: TextTheme(
        displayLarge: boldStyle(),
        displayMedium: regulartyle(),
      ),
      // bottom theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      // text fild
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintStyle: boldStyle(color: AppColors.gray, fontSize: 16),

        // fillColor: AppColors.deepBlack,
        // filled: true,
      ));
}
