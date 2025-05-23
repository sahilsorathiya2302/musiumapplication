import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/common_widget/heading_widget.dart';
import 'package:musiumapplication/core/constant/app_list.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/core/utils/sized_box_extension.dart';

class BasedOnYourRecentListeningWidget extends StatelessWidget {
  const BasedOnYourRecentListeningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.height,
        const HeadingWidget(text: AppString.basedOnYourRecentListening),
        SizedBox(
          height: 182.h,
          child: ListView.builder(
            itemCount: AppList.basedOnYourRecentListening.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var basedOnYourRecentListening = AppList.basedOnYourRecentListening[index];
              return Container(
                height: 182.h,
                width: 182.w,
                decoration: BoxDecoration(
                    color: AppColors.submitButtonColor,
                    borderRadius: BorderRadius.circular(5.r),
                    image: DecorationImage(
                        image: AssetImage(
                          basedOnYourRecentListening.image,
                        ),
                        fit: BoxFit.cover)),
              ).paddingOnly(
                right: 20.w,
                top: 10.h,
              );
            },
          ),
        )
      ],
    );
  }
}
