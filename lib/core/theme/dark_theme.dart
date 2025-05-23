import 'package:flutter/material.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkBlackColors,
      secondary: AppColors.lightBackGroundColor,
      secondaryFixed: AppColors.textFieldBorderColors,
      outline: AppColors.textFieldIconsColor,
    ));
