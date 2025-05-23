import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/common_widget/common_submit_button.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/routes/app_routes_name.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonSubmitButton(
          onTap: () {
            Get.toNamed(AppRoutesName.loginScreen);
          },
          buttonText: AppString.logInWithPassword,
        ).paddingSymmetric(horizontal: 26.w, vertical: 10.h),
      ],
    );
  }
}
