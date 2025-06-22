import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/config/colors/colors.dart';
import 'package:flutter/material.dart';

ThemeData get darkTheme {
  return ThemeData.dark().copyWith(
      // Color scheme
      colorScheme: const ColorScheme.dark(
        primary: AppColor.mainAccentColor,
        secondary: AppColor.mainAccentColor,
        surface: AppColor.secondaryBackground,
        onSurface: AppColor.textColor,
      ),

      // Scaffold
      scaffoldBackgroundColor: AppColor.primaryBackground,
      canvasColor: AppColor.secondaryBackground,

      // AppBar
      appBarTheme: const AppBarTheme(
        color: AppColor.secondaryBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.iconColor),
        titleTextStyle: TextStyle(
          color: AppColor.textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Text
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: AppColor.textColor),
        displayMedium: TextStyle(color: AppColor.textColor),
        displaySmall: TextStyle(color: AppColor.textColor),
        headlineMedium: TextStyle(color: AppColor.textColor),
        headlineSmall: TextStyle(color: AppColor.textColor),
        titleLarge: TextStyle(color: AppColor.textColor),
        titleMedium: TextStyle(color: AppColor.textColor),
        titleSmall: TextStyle(color: AppColor.textColor),
        bodyLarge: TextStyle(color: AppColor.textColor),
        bodyMedium: TextStyle(color: AppColor.textColor),
        bodySmall: TextStyle(color: AppColor.textColor),
        labelLarge: TextStyle(color: AppColor.textColor),
        labelSmall: TextStyle(color: AppColor.textColor),
      ),
      tooltipTheme: const TooltipThemeData(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColor.focusColor,
            borderRadius: AppConstants.deaultElementBorderRadius,
          ),
          textStyle: TextStyle(
            color: AppColor.textColor,
            fontSize: 14,
          )),
      // Input decoration

      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.mainAccentColor,
          foregroundColor: AppColor.textColor,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: const RoundedRectangleBorder(
            borderRadius: AppConstants.deaultElementBorderRadius,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColor.mainAccentColor,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: const RoundedRectangleBorder(
            borderRadius: AppConstants.deaultElementBorderRadius,
          ),
        ),
      ),

      // Card
      cardTheme: const CardThemeData(
        color: AppColor.secondaryBackground,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.deaultElementBorderRadius,
        ),
        elevation: 2,
      ),

      // Dialog
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColor.secondaryBackground,
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.deaultElementBorderRadius,
        ),
      ),

      // Other components
      iconTheme: const IconThemeData(
        color: AppColor.iconColor,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        elevation: 10,
        insetPadding: EdgeInsets.all(16),
        backgroundColor: AppColor.focusColor,
        contentTextStyle: TextStyle(color: AppColor.textColor, fontSize: 16),
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.deaultElementBorderRadius,
        ),
        actionTextColor: AppColor.mainAccentColor,
      ));
}
