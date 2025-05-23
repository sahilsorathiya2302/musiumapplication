import 'package:flutter/material.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/constant/app_string.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonText(
      text: AppString.noFavoriteSongsYet,
      color: Theme.of(context).colorScheme.secondary,
      fontWeight: FontWeight.w700,
    );
  }
}
