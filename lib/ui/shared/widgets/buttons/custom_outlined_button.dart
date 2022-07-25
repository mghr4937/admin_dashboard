import 'package:admin_dashboard/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final bool isFilled;

  const CustomOutlinedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = CustomColors.mainColor,
    this.isFilled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                isFilled ? color.withOpacity(0.8) : Colors.transparent),
            overlayColor: MaterialStateProperty.all(
                isFilled ? color : color.withOpacity(0.5)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
            side: MaterialStateProperty.all(BorderSide(color: color))),
        onPressed: () => onPressed(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(text,
              style: GoogleFonts.montserratAlternates(
                  fontSize: 16, color: isFilled ? Colors.white : color)),
        ));
  }
}
