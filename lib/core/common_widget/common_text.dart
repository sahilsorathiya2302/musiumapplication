import 'package:flutter/material.dart';

import '../constant/app_string.dart';

class CommonText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final List<Shadow>? shadows;
  const CommonText(
      {super.key,
      required this.text,
      required this.color,
      this.fontSize,
      this.fontWeight,
      this.shadows,
      this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.clip,
      textAlign: TextAlign.start,
      text,
      style: TextStyle(
          shadows: shadows,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily ?? AppString.cgFontFamily),
    );
  }
}
