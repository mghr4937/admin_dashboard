import 'package:admin_dashboard/ui/shared/widgets/cards/whirte_card.dart';
import 'package:admin_dashboard/ui/shared/widgets/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Dashboard",
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          const WhiteCard(
            title: 'Muchos datos',
            child: Text("Los juegos de ahora no son"),
          )
        ],
      ),
    );
  }
}
