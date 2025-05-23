import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/key/app_images_key.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/core/utils/font_size.dart';

class SearchBarWidget extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const SearchBarWidget({super.key, this.controller, this.onChanged});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextFormField(
        onChanged: widget.onChanged,
        controller: widget.controller,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: FontSize.medium,
          fontWeight: FontWeight.w600,
          fontFamily: AppString.cgFontFamily,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: AppColors.searchHintColor,
            fontSize: FontSize.thirdSmallSize_14,
            fontWeight: FontWeight.w400,
            fontFamily: AppString.cgFontFamily,
          ),
          hintText: AppString.searchHint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          fillColor: AppColors.searchBGColor,
          filled: true,
          prefixIcon: SvgPicture.asset(
            AppImagesKey.searchIcon,
            width: 10.w,
            height: 10.h,
          ).paddingSymmetric(horizontal: 12.h),
        ),
      ).paddingSymmetric(
        horizontal: 20.w,
      ),
    );
  }
}
