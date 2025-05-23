import 'package:flutter/material.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';

class CommonTextButton extends StatelessWidget {
  final String text;
  const CommonTextButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: CommonText(
          text: text,
          color: AppColors.textButtonColor,
          fontWeight: FontWeight.w700,
        ));
  }
}
