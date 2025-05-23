import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/controller/theme_controller.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/common_widget/heading_widget.dart';
import 'package:musiumapplication/core/constant/app_list.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/routes/app_routes_name.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/core/utils/font_size.dart';
import 'package:musiumapplication/core/utils/sized_box_extension.dart';

class ContinueListeningWidget extends StatelessWidget {
  const ContinueListeningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) {
        // Use a Set to filter unique categories
        Set<String> uniqueCategories = {};
        final uniqueSongs = AppList.songList.where((song) {
          if (uniqueCategories.contains(song.category)) {
            return false;
          } else {
            uniqueCategories.add(song.category);
            return true;
          }
        }).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingWidget(text: AppString.continueListening),
            10.height,
            SizedBox(
              child: GridView.builder(
                itemCount: uniqueSongs.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.9,
                  mainAxisSpacing: 9,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  var song = uniqueSongs[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutesName.musicScreen, arguments: song.category);
                    },
                    child: Container(
                      height: 60.h,
                      width: 182.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: controller.isDarkMode
                              ? AppColors.continueListeningButtonColor
                              : const Color(0xFFf9f6ee),
                          boxShadow: [
                            BoxShadow(
                              color: controller.isDarkMode
                                  ? AppColors.continueListeningButtonColor
                                  : Colors.grey.shade400,
                              blurRadius: 4,
                              spreadRadius: 1,
                            )
                          ]),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 54.h,
                            width: 53.w,
                            decoration: BoxDecoration(
                              color: AppColors.lightBackGroundColor,
                              borderRadius: BorderRadius.circular(3.r),
                              image:
                                  DecorationImage(image: AssetImage(song.image), fit: BoxFit.cover),
                            ),
                          ),
                          10.width,
                          Center(
                            child: CommonText(
                              text: song.category,
                              color: controller.isDarkMode
                                  ? AppColors.lightBackGroundColor
                                  : AppColors.darkBlackColors,
                              fontSize: FontSize.secondSmallSize_12,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            20.height,
          ],
        );
      },
    );
  }
}
