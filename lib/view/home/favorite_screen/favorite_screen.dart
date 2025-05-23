import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/controller/music_controller.dart';
import 'package:musiumapplication/core/common_widget/common_simple_app_bar.dart';
import 'package:musiumapplication/core/common_widget/common_text_scroll.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/view/home/favorite_screen/widget/empty_data_widget.dart';
import 'package:musiumapplication/view/home/favorite_screen/widget/favorite_button_widget.dart';
import 'package:musiumapplication/view/home/favorite_screen/widget/play_button_widget.dart';
import 'package:path/path.dart' as path;

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final MusicController musicController = Get.put(MusicController()); // Get the existing instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonSimpleAppBar(
        text: AppString.favorite,
      ),
      body: Obx(
        () {
          if (musicController.favoriteSong.isEmpty) {
            return const Center(child: EmptyDataWidget());
          }
          return ListView.builder(
            itemCount: musicController.favoriteSong.length,
            itemBuilder: (context, index) {
              String songPath = musicController.favoriteSong[index];

              return Container(
                height: 70.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonTextScroll(
                      text: path.basenameWithoutExtension(songPath),
                    ),

                    PlayButtonWidget(
                      songPath: songPath,
                    ),
                    FavoriteButtonWidget(removeIndix: index, songPath: songPath),
                    // Remove from Favorites
                  ],
                ).marginSymmetric(vertical: 10.h, horizontal: 20.w),
              ).paddingSymmetric(horizontal: 20, vertical: 10);
            },
          );
        },
      ),
    );
  }
}
