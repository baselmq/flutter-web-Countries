import 'package:flutter/material.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox(
      {required bool isChecked,
      required String text,
      required Function(bool?) onChanged,
      Key? key})
      : _isChecked = isChecked,
        _text = text,
        _onChanged = onChanged,
        super(key: key);

  final bool _isChecked;
  final String _text;
  final Function(bool?) _onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(value: _isChecked, onChanged: _onChanged),
        Text(
          _text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
