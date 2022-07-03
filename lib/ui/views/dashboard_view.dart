import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/login_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/cards/whirte_card.dart';
import 'package:admin_dashboard/ui/shared/widgets/labels/custom_labels.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<LoginProvider>(context).user!;

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
          WhiteCard(
            title: loggedUser.nombre,
            child: Text(loggedUser.correo),
          )
        ],
      ),
    );
  }
}
