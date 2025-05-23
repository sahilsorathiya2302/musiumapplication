import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/controller/music_controller.dart';
import 'package:musiumapplication/core/constant/app_icons.dart';

class PlayButtonWidget extends StatefulWidget {
  final String songPath;
  const PlayButtonWidget({super.key, required this.songPath});

  @override
  State<PlayButtonWidget> createState() => _PlayButtonWidgetState();
}

class _PlayButtonWidgetState extends State<PlayButtonWidget> {
  final MusicController musicController = MusicController();
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        musicController.togglePlayPause(widget.songPath);
      },
      icon: Obx(() => Icon(
            (musicController.currentSongPath.value == widget.songPath &&
                    musicController.isPlaying.value)
                ? AppIcons.pause
                : AppIcons.musicPlay,
            color: Theme.of(context).colorScheme.primary,
          )),
    );
  }
}
