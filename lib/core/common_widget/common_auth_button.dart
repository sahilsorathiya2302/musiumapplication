import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/core/utils/sized_box_extension.dart';

import '../utils/font_size.dart';
import 'common_text.dart';

class CommonAuthButton extends StatelessWidget {
  final String image;
  final String? text;
  final BoxShape shape;
  final void Function()? onTap;
  const CommonAuthButton(
      {super.key, required this.image, this.text, required this.shape, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 59.h,
            decoration: BoxDecoration(
                shape: shape,
                color: AppColors.authButtonFillColor,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondaryFixed,
                  width: 0.2,
                )),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(image),
                  height: 33.h,
                  width: 33.w,
                ),
                15.width,
                CommonText(
                  text: text ?? "",
                  color: AppColors.lightBackGroundColor,
                  fontSize: FontSize.medium,
                  fontWeight: FontWeight.w700,
                )
              ],
            ).paddingOnly(left: 35.h),
          ).paddingSymmetric(
            horizontal: 26.w,
          ),
        ),
      ],
    );
  }
}
