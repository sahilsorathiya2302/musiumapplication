import 'package:flutter/material.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';

class CommonGradientCircle extends StatelessWidget {
  final double height;
  final double width;
  const CommonGradientCircle({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            Colors.cyan,
            AppColors.submitButtonColor,
          ],
        ),
        boxShadow: [
          BoxShadow(
              color: AppColors.submitButtonColor,
              blurRadius: 18,
              spreadRadius: -8,
              offset: Offset(
                4,
                -8,
              ))
        ],
      ),
    );
  }
}
