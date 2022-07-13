import 'package:flutter/material.dart';
import '/ui/shared/widgets/labels/custom_labels.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Image.asset('assets/logo-field.png', width: 150, height: 150),
        //const Icon(Icons.sports_soccer, color: Colors.green, size: 100),

        const SizedBox(
          height: 20,
        ),
        FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Fúubool',
            style: CustomLabels.logoText,
          ),
        )
      ]),
    );
  }
}
