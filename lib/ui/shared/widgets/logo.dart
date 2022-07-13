import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset('assets/logo-field.png', width: 120, height: 120),
        const SizedBox(height: 5),
        Text(
          'Fúubool',
          style: GoogleFonts.montserratAlternates(fontSize: 30, color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
