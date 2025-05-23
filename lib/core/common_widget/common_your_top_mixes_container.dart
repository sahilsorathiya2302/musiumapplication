import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/key/app_images_key.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/core/utils/font_size.dart';

class CommonYourTopMixesContainer extends StatelessWidget {
  final String label;
  final String image;
  final Color color;
  const CommonYourTopMixesContainer(
      {super.key, required this.label, required this.image, required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150.h,
          width: 150.w,
          decoration: BoxDecoration(
              color: AppColors.lightBackGroundColor,
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.grey.shade200,
                    BlendMode.darken,
                  ),
                  image: AssetImage(image),
                  fit: BoxFit.cover)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(
                    AppImagesKey.ellipse1,
                  ),
                  fit: BoxFit.cover,
                ),
                CommonText(
                  text: label,
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w700,
                  fontSize: FontSize.medium,
                ),
              ],
            ),
            Image(
              image: AssetImage(
                AppImagesKey.ellipse2,
              ),
              fit: BoxFit.cover,
            ),
            Spacer(),
            Container(
              height: 10.h,
              width: 150.w,
              decoration: BoxDecoration(color: color),
            ),
          ],
        )
      ],
    );
  }
}
