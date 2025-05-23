import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/controller/theme_controller.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/routes/app_routes_name.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/core/utils/font_size.dart';
import 'package:musiumapplication/core/utils/sized_box_extension.dart';
import '../constant/app_icons.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final Widget? leading;
  const CommonAppBar({
    super.key,
    this.leading,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: leading,
        actions: [
          _buildIconButton(rotesName: AppRoutesName.downloadScreen, showIcon: AppIcons.download),
          _buildIconButton(rotesName: AppRoutesName.favoriteScreen, showIcon: AppIcons.favorite),
          GetBuilder<ThemeController>(
            builder: (controller) {
              return IconButton(
                icon: Icon(controller.isDarkMode ? Icons.light_mode : Icons.nights_stay),
                onPressed: () {
                  controller.toggleTheme();
                },
              );
            },
          ),
          10.width,
        ],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCommonText(context, title: title, fontSize: FontSize.medium),
            buildCommonText(context, title: subtitle, fontSize: FontSize.firstSmallSize_10),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.appGColor1,
                Theme.of(context).colorScheme.primary,
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ));
  }

  CommonText buildCommonText(BuildContext context,
      {required String title, required double fontSize}) {
    return CommonText(
      text: title,
      color: Theme.of(context).colorScheme.secondary,
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
    );
  }

  IconButton _buildIconButton({
    required String rotesName,
    required IconData showIcon,
  }) {
    return IconButton(
      onPressed: () {
        Get.toNamed(rotesName);
      },
      icon: Icon(
        showIcon,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100.0);
}
