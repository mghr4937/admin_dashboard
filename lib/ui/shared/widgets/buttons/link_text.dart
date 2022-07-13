import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//

class LinkText extends StatefulWidget {
  final String text;
  final Function? onPress;
  final Color? color;

  const LinkText({Key? key, required this.text, this.onPress, this.color = Colors.blue}) : super(key: key);

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        if (widget.onPress != null) widget.onPress!();
      }),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(widget.text,
              style: GoogleFonts.montserratAlternates(
                  fontSize: 16,
                  color: widget.color,
                  fontWeight: isHover ? FontWeight.bold : FontWeight.normal,
                  decoration: isHover ? TextDecoration.underline : TextDecoration.none)),
        ),
      ),
    );
  }
}
