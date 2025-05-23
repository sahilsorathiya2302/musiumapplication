import 'package:flutter/material.dart';

class IconsWidget extends StatefulWidget {
  final IconData icon;
  final Color? color;

  final void Function()? onPressed;
  const IconsWidget({super.key, required this.icon, this.onPressed, this.color});

  @override
  State<IconsWidget> createState() => _IconsWidgetState();
}

class _IconsWidgetState extends State<IconsWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressed,
      icon: Icon(widget.icon),
      iconSize: 20,
      color: widget.color ?? Theme.of(context).colorScheme.primary,
    );
  }
}
