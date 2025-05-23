import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/constant/app_icons.dart';
import 'package:musiumapplication/core/constant/app_string.dart';

class CommonSnakbar {
  static void showSnackbar(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.black,
    Duration duration = const Duration(seconds: 2),
  }) {
    Get.snackbar(
      AppString.error,
      message,
      duration: const Duration(seconds: 3),
      icon: AppIcons.errorIcon,
    );
  }
}
