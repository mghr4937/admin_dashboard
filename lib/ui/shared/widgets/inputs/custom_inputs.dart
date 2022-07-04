import 'package:flutter/material.dart'; //

class CustomInputs {
  static InputDecoration loginInputDecoration(
      {required String hint, required String label, required IconData iconData, Color? color = Colors.blue}) {
    return InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: color!)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: color, width: 3)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: color)),
        hintText: hint,
        hintStyle: TextStyle(color: color.withOpacity(0.7)),
        focusColor: color,
        labelText: label,
        labelStyle: TextStyle(color: color, fontSize: 18),
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
