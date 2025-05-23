import 'package:flutter/material.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/utils/font_size.dart';

class NameWidget extends StatelessWidget {
  final String text;
  const NameWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CommonText(
      text: text,
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.w700,
      fontSize: FontSize.secondLargeSize_20,
    );
  }
}
