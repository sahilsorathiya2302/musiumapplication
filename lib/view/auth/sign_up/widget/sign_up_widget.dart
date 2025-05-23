import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/routes/app_routes_name.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/core/utils/font_size.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonText(
          text: AppString.dontHaveAnAccount,
          color: Theme.of(context).colorScheme.secondary,
          fontSize: FontSize.medium,
          fontWeight: FontWeight.w500,
          fontFamily: AppString.mFontFamily,
        ),
        TextButton(
            onPressed: () {
              Get.toNamed(AppRoutesName.loginScreen);
            },
            child: CommonText(
              shadows: const [
                Shadow(
                  color: AppColors.welcomeScreenBG,
                  blurRadius: 20,
                  offset: Offset(0, 2),
                )
              ],
              text: AppString.singUp,
              fontSize: FontSize.medium,
              color: AppColors.submitButtonColor,
              fontWeight: FontWeight.w700,
              fontFamily: AppString.mFontFamily,
            ))
      ],
    );
  }
}
