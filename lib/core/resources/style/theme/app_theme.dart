import 'package:big_cart/core/resources/style/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeLight() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.backgroundWhite,
      textTheme: TextTheme(
        displaySmall: TextStyle(fontSize: 14, color: AppColors.textBlack),
      ),
    );
  }
}
