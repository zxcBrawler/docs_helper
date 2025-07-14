import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/config/colors/colors.dart';
import 'package:flutter/material.dart';

ThemeData get lightTheme {
  return ThemeData.light().copyWith(
      // Color scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.mainAccentColor,
        secondary: AppColors.mainAccentColor,
        surface: AppColors.secondaryBackgroundLight,
        onSurface: AppColors.textColorLight,
      ),

      // Scaffold
      scaffoldBackgroundColor: AppColors.primaryBackgroundLight,
      canvasColor: AppColors.secondaryBackgroundLight,

      // AppBar
      appBarTheme: const AppBarTheme(
        color: AppColors.secondaryBackgroundLight,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.iconColorLight),
        titleTextStyle: TextStyle(
          color: AppColors.textColorLight,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Text
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            color: AppColors.textColorLight, fontFamily: 'RobotoMono'),
        displayMedium: TextStyle(
            color: AppColors.textColorLight, fontFamily: 'RobotoMono'),
        displaySmall: TextStyle(
            color: AppColors.textColorLight, fontFamily: 'RobotoMono'),
        headlineMedium: TextStyle(
            color: AppColors.textColorLight, fontFamily: 'RobotoMono'),
        headlineSmall: TextStyle(
            color: AppColors.textColorLight, fontFamily: 'RobotoMono'),
        titleLarge: TextStyle(
            color: AppColors.textColorLight, fontFamily: 'RobotoMono'),
        titleMedium: TextStyle(
            color: AppColors.textColorLight, fontFamily: 'RobotoMono'),
        titleSmall: TextStyle(
            color: AppColors.textColorLight, fontFamily: 'RobotoMono'),
        bodyLarge: TextStyle(
            color: AppColors.textColorLight, fontFamily: 'RobotoMono'),
        bodyMedium: TextStyle(
            color: AppColors.textColorLight, fontFamily: 'RobotoMono'),
        bodySmall: TextStyle(
            color: AppColors.textColorLight, fontFamily: 'RobotoMono'),
        labelLarge: TextStyle(
            color: AppColors.textColorLight, fontFamily: 'RobotoMono'),
        labelSmall: TextStyle(
            color: AppColors.textColorLight, fontFamily: 'RobotoMono'),
      ),
      tooltipTheme: const TooltipThemeData(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.focusColorLight,
            borderRadius: AppConstants.deaultElementBorderRadius,
          ),
          textStyle: TextStyle(
              color: AppColors.textColorLight,
              fontSize: 14,
              fontFamily: 'RobotoMono')),
      // Input decoration

      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 16, fontFamily: 'RobotoMono'),
          backgroundColor: AppColors.mainAccentColor,
          foregroundColor: AppColors.textColor,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: const RoundedRectangleBorder(
            borderRadius: AppConstants.deaultElementBorderRadius,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.mainAccentColor,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: const TextStyle(fontSize: 16, fontFamily: 'RobotoMono'),
          shape: const RoundedRectangleBorder(
            borderRadius: AppConstants.deaultElementBorderRadius,
          ),
        ),
      ),

      // Card
      cardTheme: const CardThemeData(
        color: AppColors.secondaryBackgroundLight,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.deaultElementBorderRadius,
        ),
        elevation: 2,
      ),

      // Dialog
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColors.secondaryBackgroundLight,
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.deaultElementBorderRadius,
        ),
      ),

      // Other components
      iconTheme: const IconThemeData(
        color: AppColors.iconColorLight,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        elevation: 10,
        insetPadding: EdgeInsets.all(16),
        backgroundColor: AppColors.focusColorLight,
        contentTextStyle: TextStyle(
            color: AppColors.textColorLight,
            fontSize: 16,
            fontFamily: 'RobotoMono'),
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.deaultElementBorderRadius,
        ),
        actionTextColor: AppColors.mainAccentColor,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(strokeWidth: 2));
}
