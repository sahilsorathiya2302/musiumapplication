import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center, // Ensures children align properly
          children: [
            Container(
              height: 9,
              width: 100,
              decoration: BoxDecoration(
                color: AppColors.submitButtonColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.r),
                  bottomLeft: Radius.circular(50.r),
                ),
              ),
            ),
            Positioned(
              right: -10,
              child: Container(
                height: 10,
                width: 60,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: Theme.of(context).colorScheme.primary, width: 1)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
