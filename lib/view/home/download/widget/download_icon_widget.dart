import 'package:flutter/material.dart';

import 'package:musiumapplication/core/theme/app_colors.dart';

class DownloadIconWidget extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  const DownloadIconWidget({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      color: AppColors.submitButtonColor,
      iconSize: 30,
    );
  }
}
