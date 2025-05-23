import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/key/app_images_key.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/core/utils/font_size.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Theme.of(context).colorScheme.primary, blurRadius: 20, spreadRadius: 2)
        ],
        gradient: LinearGradient(
          colors: [
            AppColors.appGColor1,
            AppColors.appGColor2,
            Theme.of(context).colorScheme.primary,
          ],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          tileMode: TileMode.repeated,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImagesKey.appLogo,
            width: 55.w,
            height: 35.h,
            fit: BoxFit.cover,
          ),
          CommonText(
            text: AppString.search,
            color: AppColors.checkBoxShadowColor,
            fontWeight: FontWeight.w700,
            fontSize: FontSize.fifthLarge_28,
          )
        ],
      ).paddingSymmetric(
        horizontal: 10.w,
      ),
    );
  }
}
