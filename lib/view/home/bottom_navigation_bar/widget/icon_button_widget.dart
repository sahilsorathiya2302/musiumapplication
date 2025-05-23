import 'package:flutter/material.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/utils/font_size.dart';

class IconButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final void Function() onPressed;
  final IconData icon;
  final Color labelColor;
  final Color iconColor;

  const IconButtonWidget({
    super.key,
    required this.label,
    required this.onTap,
    required this.icon,
    required this.labelColor,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(icon),
            color: iconColor,
            onPressed: onPressed,
          ),
          Center(
              child: CommonText(
            text: label,
            color: labelColor,
            fontSize: FontSize.secondSmallSize_12,
            fontWeight: FontWeight.bold,
          )),
        ],
      ),
    );
  }
}
