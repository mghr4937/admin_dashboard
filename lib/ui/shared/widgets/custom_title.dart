import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Image.asset('assets/logo-field.png', width: 100, height: 100),
        //const Icon(Icons.sports_soccer, color: Colors.green, size: 100),

        const SizedBox(
          height: 20,
        ),
        // FittedBox(
        //   fit: BoxFit.contain,
        //   child: Text(
        //     'Fúubool',
        //     style: CustomLabels.logoText,
        //   ),
        // )
      ]),
    );
  }
}
