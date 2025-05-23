import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/constant/app_icons.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/key/app_images_key.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/core/utils/font_size.dart';

class LibraryHeaderWidget extends StatefulWidget {
  final Function(bool) onSearchTap;
  const LibraryHeaderWidget({super.key, required this.onSearchTap});

  @override
  State<LibraryHeaderWidget> createState() => _LibraryHeaderWidgetState();
}

class _LibraryHeaderWidgetState extends State<LibraryHeaderWidget> {
  bool isSearchActive = false;

  void toggleSearch() {
    setState(() {
      isSearchActive = !isSearchActive;
    });
    widget.onSearchTap(isSearchActive);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              AppImagesKey.appLogo,
              height: 60,
              width: 68,
            ),
            CommonText(
              text: AppString.yourLibrary,
              fontSize: FontSize.fourthLarge_25,
              color: AppColors.submitButtonColor,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
        IconButton(
          onPressed: toggleSearch,
          icon: Icon(isSearchActive ? Icons.close : AppIcons.search),
        ),
      ],
    ).paddingSymmetric(horizontal: 15);
  }
}
