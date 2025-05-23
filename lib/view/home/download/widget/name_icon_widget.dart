import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/controller/music_controller.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/constant/app_list.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/view/home/download/widget/data_widget.dart';

class NameIconWidget extends StatefulWidget {
  const NameIconWidget({super.key});

  @override
  State<NameIconWidget> createState() => _NameIconWidgetState();
}

class _NameIconWidgetState extends State<NameIconWidget> {
  final MusicController musicController = Get.put(MusicController());

  void playSong(String songName) {
    Song? selectedSong = AppList.songList.firstWhereOrNull((song) => song.songName == songName);
    if (selectedSong != null) {
      musicController.togglePlayPause(selectedSong.song);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        return musicController.downloadSong.isNotEmpty
            ? ListView.builder(
                itemCount: musicController.downloadSong.length,
                itemBuilder: (context, index) {
                  String songName = musicController.downloadSong[index];
                  return DataWidget(
                    songPath: musicController.downloadSong[index],
                    index: index,
                    songName: songName,
                  ).paddingSymmetric(vertical: 10);
                },
              )
            : const Center(
                child: CommonText(
                  text: "No downloaded songs found",
                  color: AppColors.appGColor1,
                ),
              );
      }),
    );
  }
}
