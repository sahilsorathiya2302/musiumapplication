import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/controller/music_controller.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/constant/app_icons.dart';
import 'package:musiumapplication/view/home/download/widget/download_icon_widget.dart';
import 'package:path/path.dart' as path;

class DataWidget extends StatefulWidget {
  final String songName;
  final String songPath;
  final int index;

  const DataWidget({
    super.key,
    required this.songName,
    required this.index,
    required this.songPath,
  });

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

final MusicController controller = Get.put(MusicController());

class _DataWidgetState extends State<DataWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 80,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Play/Pause Button
            DownloadIconWidget(
              icon:
                  controller.isPlaying.value && controller.currentSongPath.value == widget.songPath
                      ? AppIcons.pause
                      : AppIcons.musicPlay,
              onPressed: () {
                controller.togglePlayPause(widget.songPath);
              },
            ),

            // Song Name (Formatted)
            Expanded(
              child: CommonText(
                text: path.basenameWithoutExtension(widget.songPath), // ✅ Show only song name
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),

            // Delete Button
            DownloadIconWidget(
              icon: AppIcons.delete,
              onPressed: () => _showDeleteConfirmation(controller),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(MusicController controller) {
    Get.defaultDialog(
      title: "Delete Song?",
      middleText: "Are you sure you want to delete '${widget.songName}'?",
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      onConfirm: () {
        controller.removeSong(widget.songPath);
        controller.togglePlayPause(widget.songPath);
        Get.back();
      },
    );
  }
}
