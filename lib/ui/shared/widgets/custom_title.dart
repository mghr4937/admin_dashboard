import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        //Image.asset('futim-logo.png', width: 50, height: 50),
        const Icon(Icons.sports_soccer, color: Colors.green, size: 100),
        const SizedBox(
          height: 20,
        ),
        FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Fúubool',
            style: GoogleFonts.montserratAlternates(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}
