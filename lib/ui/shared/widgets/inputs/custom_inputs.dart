import 'package:flutter/material.dart'; //

class CustomInputs {
  static InputDecoration loginInputDecoration(
      {required String hint, required String label, required IconData iconData}) {
    return InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(iconData, color: Colors.blue));
  }

  static InputDecoration searchInputDecoration({required String hint, required IconData iconData}) {
    return InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: hint,
        prefixIcon: Icon(
          iconData,
          color: Colors.black,
          size: 30,
        ),
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)));
  }
}
