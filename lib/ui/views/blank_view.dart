import 'package:flutter/material.dart';
import '/ui/shared/widgets/cards/whirte_card.dart';
import '/ui/shared/widgets/labels/custom_labels.dart';

class BlankView extends StatelessWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Blank View",
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          const WhiteCard(
            title: 'Muchos datos',
            child: Text("nada"),
          )
        ],
      ),
    );
  }
}
