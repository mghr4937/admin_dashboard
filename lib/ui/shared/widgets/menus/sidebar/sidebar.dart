import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/menus/sidebar/custom_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
//import 'package:admin_dashboard/ui/layouts/auth/widgets/text_separator.dart';

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
          const SizedBox(height: 50),
          //const TextSeparator(text: 'main'),
          CustomMenuItem(
              text: 'Dashboard',
              icon: const Icon(Icons.dashboard_outlined),
              onPressed: () => SideBarProvider.closeMenu()),
          CustomMenuItem(text: 'Campeonatos', icon: const Icon(Icons.webhook_outlined), onPressed: () {}),
          CustomMenuItem(text: 'Equipos', icon: const Icon(Icons.dataset_outlined), onPressed: () {}),
          CustomMenuItem(text: 'Usuarios', icon: const Icon(Icons.person_search_outlined), onPressed: () {}),
          CustomMenuItem(text: 'Configuración', icon: const Icon(Icons.settings_outlined), onPressed: () {}),
          const SizedBox(height: 50),
          CustomMenuItem(text: 'Salir', icon: const Icon(Icons.logout_outlined), onPressed: () {}),
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
