import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {
  final String text;
  final Icon icon;
  final bool isActive;
  final Function onPressed;

  const CustomMenuItem(
      {Key? key, required this.text, required this.icon, this.isActive = false, required this.onPressed})
      : super(key: key);

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: isHovered
            ? Colors.green.withOpacity(0.1)
            : widget.isActive
                ? Colors.green.withOpacity(0.1)
                : Colors.transparent,
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.isActive ? null : (() => widget.onPressed()),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: MouseRegion(
                  onEnter: (event) => setState(() => isHovered = true),
                  onExit: (event) => setState(() => isHovered = false),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Icon(widget.icon.icon, color: Colors.white.withOpacity(0.3)),
                    const SizedBox(width: 10),
                    Text(
                      widget.text,
                      style: GoogleFonts.roboto(fontSize: 14, color: Colors.green.withOpacity(0.3)),
                    )
                  ]),
                ),
              ),
            )));
  }
}
