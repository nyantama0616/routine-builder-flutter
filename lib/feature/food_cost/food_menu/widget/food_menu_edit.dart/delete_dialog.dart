import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  final Function()? onConfirm;
  final Function()? onCancel;

  DeleteDialog({this.onConfirm, this.onCancel});

  @override
  Widget build(BuildContext context) {
    //TODO: デザインを整える
    return AlertDialog(
      title: Text("削除しますか？"),
      actions: [
        TextButton(
          onPressed: onConfirm,
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: Text("削除", style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: onCancel,
          child: Text("キャンセル"),
        ),
      ],
    );
  }
}
