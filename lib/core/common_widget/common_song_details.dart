import 'package:flutter/material.dart';
import 'package:musiumapplication/core/utils/font_size.dart';
import 'package:text_scroll/text_scroll.dart';

import '../constant/app_string.dart';
import 'common_text.dart';

class CommonSongDetails extends StatelessWidget {
  final String? songName;

  final String? category;
  const CommonSongDetails({super.key, this.songName, this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 120,
          child: TextScroll(
            songName ?? "",
            velocity: const Velocity(pixelsPerSecond: Offset(20, 0)),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontFamily: AppString.cgFontFamily,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        CommonText(
          text: category ?? "",
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w700,
          fontSize: FontSize.thirdSmallSize_14,
        ),
      ],
    );
  }
}
