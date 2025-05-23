import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/common_widget/common_submit_button.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/routes/app_routes_name.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/core/utils/font_size.dart';
import 'package:musiumapplication/view/auth/welcome/widget/progress_bar.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({super.key});

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  double progress = 0.5; // Example progress value (50%)

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 360.h, // Responsive height
          width: double.infinity, // Make it responsive
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.r),
              topRight: Radius.circular(50.r),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h), // Added padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Centered RichText
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: AppString.fromThe,
                  style: TextStyle(
                    fontFamily: AppString.cgFontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: FontSize.thirdLardSize_22, // Responsive font size
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  children: [
                    const TextSpan(
                      text: AppString.latest,
                      style: TextStyle(color: AppColors.submitButtonColor),
                    ),
                    TextSpan(
                      text: AppString.toThe,
                      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    ),
                    const TextSpan(
                      text: "\n ${AppString.greatest} ",
                      style: TextStyle(
                        color: AppColors.submitButtonColor,
                      ),
                    ),
                    TextSpan(
                      text: AppString.hitsPlayYour,
                      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    ),
                    TextSpan(
                      text: "\n${AppString.favoriteTracksOn}",
                      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    ),
                    TextSpan(
                      text: AppString.musium,
                      style: TextStyle(
                        color: AppColors.submitButtonColor,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: AppColors.submitButtonColor.withOpacity(0.9),
                            blurRadius: 5, // Glow effect
                          ),
                        ],
                      ),
                    ),
                    TextSpan(
                      text: "\n${AppString.now}",
                      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),
              ),

              const ProgressBar(),

              // Submit Button
              CommonSubmitButton(
                onTap: () => Get.toNamed(AppRoutesName.signUpScreen),
                buttonText: AppString.getStarted,
              ), // Your existing button
            ],
          ),
        ),
      ],
    );
  }
}
