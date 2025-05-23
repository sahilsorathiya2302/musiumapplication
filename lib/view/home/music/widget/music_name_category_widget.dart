import 'package:flutter/material.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/utils/font_size.dart';

class MusicNameCategoryWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  const MusicNameCategoryWidget({super.key, required this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return CommonText(
      text: text,
      color: Theme.of(context).colorScheme.primary,
      fontSize: fontSize ?? FontSize.thirdSmallSize_14,
      fontWeight: FontWeight.w700,
    );
  }
}
