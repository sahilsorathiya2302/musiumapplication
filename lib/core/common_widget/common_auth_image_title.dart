import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/utils/sized_box_extension.dart';

import '../key/app_images_key.dart';
import 'common_text.dart';

class CommonAuthImageTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  const CommonAuthImageTitle({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Container(
            height: 150.h,
            width: 300.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppImagesKey.appLogo,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        10.height,
        Center(
          child: CommonText(
            text: text,
            color: Theme.of(context).colorScheme.secondary,
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ).paddingOnly(bottom: 20.h);
  }
}
