import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';

class CommonAuthCircleButton extends StatelessWidget {
  final String image;
  final void Function()? onTap;
  const CommonAuthCircleButton({super.key, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 59.h,
        width: 59.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.authButtonFillColor,
          image: DecorationImage(
            image: AssetImage(image),
          ),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondaryFixed,
            width: 0.2,
          ),
        ),
      ).paddingSymmetric(
        horizontal: 26.w,
      ),
    );
  }
}
