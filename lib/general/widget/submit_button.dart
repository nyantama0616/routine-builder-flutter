import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final SubmitButtonType type;
  final Color color;

  SubmitButton(this.label,
      {required this.icon, required this.type, required this.onPressed}) : color = _getButtonColor(type);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(label),
      icon: Icon(icon),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
      ),
    );
  }
}

enum SubmitButtonType { save, delete, edit }

Color _getButtonColor(SubmitButtonType type) {
  switch (type) {
    case SubmitButtonType.save:
      return Colors.blue;
    case SubmitButtonType.delete:
      return Colors.red;
    case SubmitButtonType.edit:
      return Colors.green;
  }
}
