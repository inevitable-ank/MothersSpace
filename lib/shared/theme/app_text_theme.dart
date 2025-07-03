import 'package:flutter/material.dart';

/// Text styles for MamaVault
class AppTextTheme {
  AppTextTheme._();

  static TextTheme get textTheme => TextTheme(
        headline1: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        headline6: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        subtitle1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
        bodyText1: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
        ),
        bodyText2: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
        button: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.surface,
        ),
        caption: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: AppColors.textSecondary,
        ),
      );
}