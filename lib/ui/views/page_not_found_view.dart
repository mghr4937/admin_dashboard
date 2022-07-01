import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageNotFoundView extends StatelessWidget {
  const PageNotFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Center(
        child: Text(
          '404 - Ooops, no hay nada :(',
          style: GoogleFonts.montserratAlternates(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
