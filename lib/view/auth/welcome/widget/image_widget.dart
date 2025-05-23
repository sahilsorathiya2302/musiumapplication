import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/key/app_images_key.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage(
        AppImagesKey.welcomeImages,
      ),
      fit: BoxFit.cover,
    ).paddingSymmetric(vertical: 124.h);
  }
}
