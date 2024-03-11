import 'package:flutter/material.dart';

class ButtonBase extends StatelessWidget {
  final String text;
  final Icon icon;
  final Color color;
  final Function()? onPressed;
  
  const ButtonBase({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(text),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
      ),
    );
  }
}
