import 'package:admin_dashboard/ui/shared/widgets/labels/custom_labels.dart';
import 'package:flutter/material.dart';

import '../../../utils/custom_colors.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        //Image.asset('assets/logo-field.png', width: 100, height: 100),
        Icon(Icons.sports_soccer,
            color: CustomColors.mainColor, size: _logoSize(size.height)),

        const SizedBox(
          height: 10,
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

  double _logoSize(double height) {
    if (height <= 601) {
      return height * 0.05;
    } else {
      return height * 0.1;
    }
  }
}
