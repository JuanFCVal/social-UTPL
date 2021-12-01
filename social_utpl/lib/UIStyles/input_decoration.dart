import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration inputDecoration({
    required BuildContext context,
    required String labelText,
    IconData? icon,
    String? hintText,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixIcon: Icon(icon, color: Theme.of(context).secondaryHeaderColor),
      labelStyle: TextStyle(color: Theme.of(context).secondaryHeaderColor),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Theme.of(context).secondaryHeaderColor,
              width: 1.5)),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Theme.of(context).secondaryHeaderColor,
            width: 2.5),
      ),
    );
  }
}
