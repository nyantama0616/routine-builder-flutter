import "package:flutter/material.dart";

import "button_base.dart";

class WakeUpButton extends StatelessWidget {
  final Function()? onPressed;

  const WakeUpButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonBase(
      text: "起きる",
      icon: const Icon(Icons.sunny),
      color: Colors.orange,
      onPressed: onPressed,
    );
  }
}
