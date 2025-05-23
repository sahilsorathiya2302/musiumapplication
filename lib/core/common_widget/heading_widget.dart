import 'package:flutter/material.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/utils/font_size.dart';

class HeadingWidget extends StatelessWidget {
  final String text;
  const HeadingWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CommonText(
      text: text,
      color: Theme.of(context).colorScheme.secondary,
      fontSize: FontSize.secondLargeSize_20,
      fontWeight: FontWeight.w700,
    );
  }
}
