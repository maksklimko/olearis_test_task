import 'package:flutter/material.dart';
import 'package:olearis_test_task/config/resources/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSwatch(),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.blue,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      border: _getInputBorder(AppColors.grey),
      errorBorder: _getInputBorder(AppColors.red),
      focusedErrorBorder: _getInputBorder(AppColors.red),
      enabledBorder: _getInputBorder(AppColors.grey),
      focusedBorder: _getInputBorder(AppColors.blue),
      disabledBorder: _getInputBorder(AppColors.grey),
    ),
  );

  static _getInputBorder(Color color) => UnderlineInputBorder(
        borderSide: BorderSide(color: color),
      );
}
