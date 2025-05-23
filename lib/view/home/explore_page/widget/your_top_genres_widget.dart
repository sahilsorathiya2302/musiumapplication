import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/core/utils/font_size.dart';

class YourTopGenresWidget extends StatefulWidget {
  final List name;
  const YourTopGenresWidget({super.key, required this.name});

  @override
  State<YourTopGenresWidget> createState() => _YourTopGenresWidgetState();
}

class _YourTopGenresWidgetState extends State<YourTopGenresWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(), // Disables inner scrolling
      shrinkWrap: true,
      padding: EdgeInsets.zero, // Removes default padding
      itemCount: widget.name.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 13,
        childAspectRatio: 1.6,
      ),
      itemBuilder: (context, index) {
        var songData = widget.name[index];
        return Container(
          decoration: BoxDecoration(
            color: songData.color,
            borderRadius: BorderRadius.circular(7.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CommonText(
                    text: songData.label,
                    color: AppColors.lightBackGroundColor,
                    fontSize: FontSize.medium,
                    fontWeight: FontWeight.w700,
                  ),
                ).paddingOnly(left: 10, top: 15),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  width: 85.w, // Adjust width dynamically
                  height: 85.h,
                  songData.image,
                  fit: BoxFit.cover, // Prevents overflow
                ),
              ),
            ],
          ),
        );
      },
    ).paddingOnly(left: 20.w, right: 20.w, bottom: 20.h);
  }
}
