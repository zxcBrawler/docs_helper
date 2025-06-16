import 'package:flutter/material.dart';

class BasicIconButton extends StatelessWidget {
  final Icon icon;
  final Function()? onPressed;
  final String? tooltip;
  const BasicIconButton(
      {super.key, required this.icon, this.onPressed, this.tooltip});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      tooltip: tooltip,
    );
  }
}
