import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

import '../constant/app_string.dart';

class CommonTextScroll extends StatelessWidget {
  final String text;
  const CommonTextScroll({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Center(
        child: TextScroll(
          text,
          velocity: const Velocity(pixelsPerSecond: Offset(20, 0)),
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontFamily: AppString.cgFontFamily,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
