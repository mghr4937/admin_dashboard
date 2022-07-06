import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;
  final IconData icon;

  const CustomIconButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.icon,
      this.color = Colors.green,
      this.isFilled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          backgroundColor: MaterialStateProperty.all(color),
          overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(0.3))),
      onPressed: () => onPressed(),
      child: Row(children: [
        Icon(icon, color: Colors.white),
        Text(' $text', style: GoogleFonts.montserratAlternates(color: Colors.white))
      ]),
    );
  }
}
