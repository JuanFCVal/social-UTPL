import 'package:flutter/material.dart';

class ButtonsDecoration {
  static ButtonStyle buttonStyle({
    required BuildContext context,
    required double elevation,
  }) {
    return ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
        elevation: MaterialStateProperty.all<double>(elevation),
        shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))));
  }
}
