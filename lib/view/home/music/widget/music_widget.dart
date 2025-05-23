import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/controller/music_controller.dart';
import 'package:musiumapplication/core/constant/app_icons.dart';
import 'package:musiumapplication/core/constant/app_list.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/view/home/music/widget/icons_widget.dart';
import 'package:musiumapplication/view/home/music/widget/music_name_category_widget.dart';
import 'package:text_scroll/text_scroll.dart';

class MusicWidget extends StatefulWidget {
  final String category;
  const MusicWidget({super.key, required this.category});

  @override
  State<MusicWidget> createState() => _MusicWidgetState();
}

class _MusicWidgetState extends State<MusicWidget> {
  @override
  Widget build(BuildContext context) {
    final MusicController controller = Get.put(MusicController());

    final filteredSongs =
        AppList.songList.where((song) => song.category == widget.category).toList();

    return Expanded(
      child: ListView.builder(
        itemCount: filteredSongs.length,
        itemBuilder: (context, index) {
          final songs = filteredSongs[index];
          String newPath = "assets/${songs.song}";

          return Obx(() {
            bool isPlaying =
                controller.isPlaying.value && controller.currentSongPath.value == newPath;
            bool isLoading =
                controller.isDownloading.value && controller.currentSongPath.value == newPath;
            bool isFavorite = controller.favoriteSong.contains(newPath);

            return Container(
              height: 80.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  // **Song Image**
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(
                      songs.image,
                      height: 70.h,
                      width: 70.w,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: 10.w),

                  SizedBox(
                    width: 75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextScroll(
                          songs.songName,
                          velocity: const Velocity(pixelsPerSecond: Offset(30, 0)),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontFamily: AppString.cgFontFamily,
                              fontWeight: FontWeight.w700),
                        ),
                        MusicNameCategoryWidget(text: songs.category),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconsWidget(
                        icon: isPlaying ? AppIcons.pause : AppIcons.musicPlay,
                        onPressed: () {
                          print(
                              "==================>Before Toggle: isPlaying = ${controller.isPlaying.value}, currentSongPath = ${controller.currentSongPath.value}");
                          controller.togglePlayPause(newPath);

                          print(
                              "=---------------------->After Toggle: isPlaying = ${controller.isPlaying.value}, currentSongPath = ${controller.currentSongPath.value}");
                        },
                      ),
                      isLoading
                          ? const CircularProgressIndicator()
                          : IconsWidget(
                              icon: AppIcons.download,
                              onPressed: () {
                                controller.downloadFromAsset(
                                    "assets/${songs.song}", "${songs.songName}.mp3");
                              },
                            ),
                      IconsWidget(
                        color: AppColors.errorColor,
                        icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                        onPressed: () {
                          controller.addToFavorite(newPath);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ).paddingSymmetric(vertical: 10.h, horizontal: 20.w);
          });
        },
      ),
    );
  }
}
