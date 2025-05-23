import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/controller/music_controller.dart';
import 'package:musiumapplication/core/constant/app_icons.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';

class FavoriteButtonWidget extends StatefulWidget {
  final int removeIndix;
  final String songPath;
  const FavoriteButtonWidget({super.key, required this.removeIndix, required this.songPath});

  @override
  State<FavoriteButtonWidget> createState() => _FavoriteButtonWidgetState();
}

final MusicController musicController = Get.put(MusicController());

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Obx(() => Icon(
            (musicController.currentSongPath.value == widget.songPath &&
                    musicController.isFavorite.value)
                ? AppIcons.favorite
                : Icons.favorite_border,
            color: AppColors.errorColor,
          )),
      onPressed: () {
        musicController.removeFromFavorite(widget.removeIndix);
      },
    );
  }
}
