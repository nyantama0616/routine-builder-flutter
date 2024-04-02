import 'package:flutter/material.dart';

class DetailItemEditable extends StatelessWidget {
  final String label;
  final String value;
  final bool isEditable;
  final Function(String, String)? onChanged;

  DetailItemEditable(this.label, this.value,
      {this.isEditable = false, this.onChanged});

  void _onChanged(String value) {
    onChanged?.call(label, value);
  }

  @override
  Widget build(BuildContext context) {
    final text = isEditable
        ? TextField(
            controller: TextEditingController(text: value),
            onChanged: _onChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ))
        : Text(value, style: TextStyle(fontSize: 16));

    return ListTile(
      title: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: SizedBox(
        width: 100,
        child: text,
      ),
    );
  }
}
