import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/authentication_provider.dart';
import '/ui/shared/widgets/cards/whirte_card.dart';
import '/ui/shared/widgets/labels/custom_labels.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<AuthenticationProvider>(context).getUser;

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
            title: loggedUser.displayName,
            child: Text(loggedUser.email!),
          )
        ],
      ),
    );
  }
}
