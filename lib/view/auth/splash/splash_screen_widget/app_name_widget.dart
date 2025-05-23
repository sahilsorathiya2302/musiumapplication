import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/key/app_images_key.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 300.w,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
        AppImagesKey.appLogoTitle,
      ))),
    );
  }
}
