import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/controller/music_controller.dart';
import 'package:musiumapplication/core/common_widget/common_song_details.dart';
import 'package:musiumapplication/core/constant/app_icons.dart';
import 'package:musiumapplication/core/constant/app_list.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';

class SongShowWidget extends StatefulWidget {
  final String? searchData;
  const SongShowWidget({super.key, this.searchData});

  @override
  State<SongShowWidget> createState() => _SongShowWidgetState();
}

class _SongShowWidgetState extends State<SongShowWidget> {
  final MusicController musicController = Get.put(MusicController());

  @override
  Widget build(BuildContext context) {
    var query = widget.searchData?.trim().toLowerCase() ?? "";
    var filteredSongs = query.isEmpty
        ? AppList.songList
        : AppList.songList.where((song) {
            return song.songName.toLowerCase().contains(query) ||
                song.category.toLowerCase().contains(query);
          }).toList();

    return SizedBox(
      height: context.height,
      child: ListView.builder(
        itemCount: filteredSongs.length,
        itemBuilder: (context, index) {
          var data = filteredSongs[index];
          String songPath = "${data.song}";
          print("====>${songPath}");
          return Container(
            height: 80.h,
            decoration: BoxDecoration(
              color: AppColors.submitButtonColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    data.image,
                    height: 50.h,
                    width: 50.w,
                    fit: BoxFit.cover,
                  ),
                ),
                CommonSongDetails(
                  songName: data.songName,
                  category: data.category,
                ),
                Obx(
                  () => IconButton(
                    onPressed: () {
                      musicController.togglePlayPause("assets/" + songPath);
                    },
                    icon: Icon(
                      (musicController.currentSongPath.value == songPath &&
                              musicController.isPlaying.value)
                          ? Icons.pause_circle // Show pause icon if playing
                          : AppIcons.musicPlay, // Show play icon otherwise
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    musicController.downloadFromAsset(songPath, "${data.songName}.mp3");
                  },
                  icon: const Icon(AppIcons.download),
                ),
              ],
            ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
          ).paddingSymmetric(horizontal: 20.w, vertical: 10.h);
        },
      ),
    );
  }
}
