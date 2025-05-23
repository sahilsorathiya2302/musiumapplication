import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/utils/font_size.dart';

class CommonDividerTitle extends StatelessWidget {
  final String text;
  const CommonDividerTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(child: Divider(color: Theme.of(context).colorScheme.secondary)),
      CommonText(
        text: text,
        color: Theme.of(context).colorScheme.secondary,
        fontWeight: FontWeight.w700,
        fontSize: FontSize.medium,
      ).paddingSymmetric(horizontal: 15),
      Expanded(
        child: Divider(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    ]).paddingSymmetric(horizontal: 38.w, vertical: 20.h);
  }
}
