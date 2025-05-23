import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/core/utils/font_size.dart';

class CommonSubmitButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;
  const CommonSubmitButton({super.key, required this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 377.w,
        height: 59.h,
        decoration: BoxDecoration(
          color: AppColors.submitButtonColor,
          borderRadius: BorderRadius.circular(50.r),
          boxShadow: const [
            BoxShadow(
              color: AppColors.submitButtonColor,
              spreadRadius: 0.5,
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
            child: CommonText(
          text: buttonText,
          fontSize: FontSize.medium,
          color: AppColors.lightBackGroundColor,
          fontWeight: FontWeight.w700,
        )),
      ),
    ).paddingSymmetric(horizontal: 17.w);
  }
}
