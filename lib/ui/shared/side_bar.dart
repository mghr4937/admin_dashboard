import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/logo.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/text_separator.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(
            height: 50,
          ),
          const TextSeparator(text: 'main'),
          CustomMenuItem(text: 'Dashboard', icon: const Icon(Icons.dashboard), onPressed: () {})
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
      gradient: LinearGradient(colors: [
        Colors.black,
        Colors.black87,
      ]),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)]);
}
