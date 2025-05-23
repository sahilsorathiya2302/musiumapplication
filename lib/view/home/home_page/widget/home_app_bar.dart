import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:musiumapplication/core/common_widget/common_app_bar.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/storage/key/storage_key.dart';
import 'package:musiumapplication/storage/storage_object/storage_object.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

final box = GetStorage();

class _HomeAppBarState extends State<HomeAppBar> {
  String userImages = StorageObject.read(StorageKey.images);
  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      leading: Center(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                AppColors.userImagesGColor1,
                AppColors.userImagesGColor2,
              ], // Border gradient
            ),
          ),
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Image.network(userImages),
                ),
              );
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImages.isNotEmpty
                  ? userImages
                  : "https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?q=80&w=1945&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
              backgroundColor: Colors.white, // Replace with AppColors.lightBackGroundColor
            ).paddingAll(4),
          ),
        ),
      ).paddingOnly(left: 10),
      title: AppString.welcomeBack,
      subtitle: StorageObject.read(StorageKey.name),
    );
  }
}
