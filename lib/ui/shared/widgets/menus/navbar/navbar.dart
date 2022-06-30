import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/menus/navbar/navbar_avatar.dart';
import 'package:admin_dashboard/ui/shared/widgets/menus/navbar/notifications_indicator.dart';
import 'package:admin_dashboard/ui/shared/widgets/inputs/search_text.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          //TODO: icono del menu

          if (size.width <= 700)
            IconButton(
                icon: const Icon(Icons.menu_outlined),
                onPressed: () => SideBarProvider.openMenu(),
                color: Colors.black),

          const SizedBox(width: 10),

          //Searchbox
          if (size.width > 410)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const SearchText(),
            ),

          const Spacer(),
          const NotificationsIndicator(),
          const SizedBox(width: 10),
          const NavBarAvatar(),
          const SizedBox(width: 20)
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() =>
      const BoxDecoration(color: Colors.green, boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)]);
}
