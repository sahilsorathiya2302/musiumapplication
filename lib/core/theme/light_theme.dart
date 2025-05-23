import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightBackGroundColor,
      secondary: AppColors.darkBlackColors,
      secondaryFixed: AppColors.textFieldBorderColors,
      outline: AppColors.textFieldIconsColor,
    ));
