import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musiumapplication/core/common_widget/common_gradient_circle.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/core/utils/sized_box_extension.dart';
import 'package:musiumapplication/view/auth/welcome/widget/bottom_button.dart';
import 'package:musiumapplication/view/auth/welcome/widget/image_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.welcomeScreenBG,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const ImageWidget(),
          Align(
            alignment: Alignment.topLeft,
            child: CommonGradientCircle(
              height: 146.h,
              width: 149.w,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                CommonGradientCircle(
                  height: 103.h,
                  width: 103.w,
                ),
                100.height,
                CommonGradientCircle(
                  height: 78.h,
                  width: 78.w,
                ),
              ],
            ),
          ),
          const BottomButton(),
        ],
      ),
    );
  }
}
