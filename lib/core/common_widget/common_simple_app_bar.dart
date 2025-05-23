import 'package:flutter/material.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/utils/font_size.dart';

class CommonSimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const CommonSimpleAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CommonText(
        text: text,
        color: Theme.of(context).colorScheme.secondary,
        fontSize: FontSize.firstLargeSize_18,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}
