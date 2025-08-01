import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/config/colors/colors.dart';
import 'package:flutter/material.dart';

ThemeData get darkTheme {
  return ThemeData.dark().copyWith(
      // Color scheme
      colorScheme: const ColorScheme.dark(
        primary: AppColors.mainAccentColor,
        secondary: AppColors.mainAccentColor,
        surface: AppColors.secondaryBackground,
        onSurface: AppColors.textColor,
      ),

      // Scaffold
      scaffoldBackgroundColor: AppColors.primaryBackground,
      canvasColor: AppColors.secondaryBackground,

      // AppBar
      appBarTheme: const AppBarTheme(
        color: AppColors.secondaryBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.iconColor),
        titleTextStyle: TextStyle(
          color: AppColors.textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Text
      textTheme: const TextTheme(
        displayLarge:
            TextStyle(color: AppColors.textColor, fontFamily: 'RobotoMono'),
        displayMedium:
            TextStyle(color: AppColors.textColor, fontFamily: 'RobotoMono'),
        displaySmall:
            TextStyle(color: AppColors.textColor, fontFamily: 'RobotoMono'),
        headlineMedium:
            TextStyle(color: AppColors.textColor, fontFamily: 'RobotoMono'),
        headlineSmall:
            TextStyle(color: AppColors.textColor, fontFamily: 'RobotoMono'),
        titleLarge:
            TextStyle(color: AppColors.textColor, fontFamily: 'RobotoMono'),
        titleMedium:
            TextStyle(color: AppColors.textColor, fontFamily: 'RobotoMono'),
        titleSmall:
            TextStyle(color: AppColors.textColor, fontFamily: 'RobotoMono'),
        bodyLarge:
            TextStyle(color: AppColors.textColor, fontFamily: 'RobotoMono'),
        bodyMedium:
            TextStyle(color: AppColors.textColor, fontFamily: 'RobotoMono'),
        bodySmall:
            TextStyle(color: AppColors.textColor, fontFamily: 'RobotoMono'),
        labelLarge:
            TextStyle(color: AppColors.textColor, fontFamily: 'RobotoMono'),
        labelSmall:
            TextStyle(color: AppColors.textColor, fontFamily: 'RobotoMono'),
      ),
      tooltipTheme: const TooltipThemeData(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.focusColor,
            borderRadius: AppConstants.deaultElementBorderRadius,
          ),
          textStyle: TextStyle(
              color: AppColors.textColor,
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
        color: AppColors.secondaryBackground,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.deaultElementBorderRadius,
        ),
        elevation: 2,
      ),

      // Dialog
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColors.secondaryBackground,
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.deaultElementBorderRadius,
        ),
      ),

      // Other components
      iconTheme: const IconThemeData(
        color: AppColors.iconColor,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        elevation: 10,
        insetPadding: EdgeInsets.all(16),
        backgroundColor: AppColors.focusColor,
        contentTextStyle: TextStyle(
            color: AppColors.textColor, fontSize: 16, fontFamily: 'RobotoMono'),
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.deaultElementBorderRadius,
        ),
        actionTextColor: AppColors.mainAccentColor,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(strokeWidth: 2));
}
