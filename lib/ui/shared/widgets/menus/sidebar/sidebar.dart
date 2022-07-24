import 'package:admin_dashboard/providers/authentication_provider.dart';
import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/ui/shared/widgets/menus/sidebar/custom_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logo.dart';
//import 'package:admin_dashboard/ui/layouts/auth/widgets/text_separator.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  void navigateTo(String path) {
    NavigationService.replaceTo(path);
    SideBarProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideBarProvider = Provider.of<SideBarProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 30),
          //const TextSeparator(text: 'main'),
          CustomMenuItem(
            isActive: sideBarProvider.currentPage == Flurorouter.dashboardPath,
            text: 'Dashboard',
            icon: const Icon(Icons.dashboard_outlined),
            onPressed: () => navigateTo(Flurorouter.dashboardPath),
          ),
          CustomMenuItem(
              text: 'Campeonatos',
              icon: const Icon(Icons.webhook_outlined),
              onPressed: () {}),
          CustomMenuItem(
              text: 'Equipos',
              icon: const Icon(Icons.dataset_outlined),
              onPressed: () {}),

          CustomMenuItem(
              isActive: sideBarProvider.currentPage == Flurorouter.usersPath,
              text: 'Usuarios',
              icon: const Icon(Icons.person_search_outlined),
              onPressed: () => navigateTo(Flurorouter.usersPath)),

          const SizedBox(height: 30),

          CustomMenuItem(
            isActive: sideBarProvider.currentPage == Flurorouter.categoriesPath,
            text: 'Categorias',
            icon: const Icon(Icons.category_outlined),
            onPressed: () => navigateTo(Flurorouter.categoriesPath),
          ),

          CustomMenuItem(
            isActive: sideBarProvider.currentPage == Flurorouter.blankPath,
            text: 'Blank View',
            icon: const Icon(Icons.rate_review_outlined),
            onPressed: () => navigateTo(Flurorouter.blankPath),
          ),
          CustomMenuItem(
            isActive: sideBarProvider.currentPage == Flurorouter.animationPath,
            text: 'Animation View',
            icon: const Icon(Icons.animation_outlined),
            onPressed: () => navigateTo(Flurorouter.animationPath),
          ),
          CustomMenuItem(
            isActive: sideBarProvider.currentPage == Flurorouter.iconsPath,
            text: 'Iconos',
            icon: const Icon(Icons.table_bar_outlined),
            onPressed: () => navigateTo(Flurorouter.iconsPath),
          ),
          const SizedBox(height: 20),
          CustomMenuItem(
              text: 'Configuración',
              icon: const Icon(Icons.settings_outlined),
              onPressed: () {}),
          CustomMenuItem(
              text: 'Salir',
              icon: const Icon(Icons.logout_outlined),
              onPressed: () =>
                  Provider.of<AuthenticationProvider>(context, listen: false)
                      .logout()),
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
