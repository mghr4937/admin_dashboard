import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.sports_soccer, color: Colors.green, size: 50),
        const SizedBox(width: 5),
        Text(
          'Fuubool',
          style: GoogleFonts.montserratAlternates(fontSize: 30, color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
