import "package:flutter/material.dart";

import "button_base.dart";

class SleepButton extends StatelessWidget {
  final Function()? onPressed;

  const SleepButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonBase(
      text: "寝る",
      icon: const Icon(Icons.bedtime),
      color: Colors.blue,
      onPressed: onPressed,
    );
  }
}
