import 'package:flutter/material.dart'; //

class CustomInputs {
  static InputDecoration loginInputDecoration(
      {required String hint, required String label, required IconData iconData, Color? color = Colors.blue}) {
    return InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: color!)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: color)),
        hintText: hint,
        helperText: 'alal',
        hintStyle: TextStyle(color: color.withOpacity(0.5)),
        labelText: label,
        prefixIcon: Icon(iconData, color: color));
  }

  static InputDecoration searchInputDecoration(
      {required String hint, required IconData iconData, Color? color = Colors.black}) {
    return InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: hint,
        prefixIcon: Icon(
          iconData,
          color: color,
          size: 30,
        ),
        hintStyle: TextStyle(color: color!.withOpacity(0.5)));
  }
}
