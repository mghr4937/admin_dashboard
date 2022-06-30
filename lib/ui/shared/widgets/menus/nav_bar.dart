import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/shared/widgets/inputs/search_text.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          //TODO: icono del menu
          IconButton(icon: const Icon(Icons.menu_outlined), onPressed: () {}, color: Colors.black),
          const SizedBox(width: 5),

          //Searchbox
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: const SearchText(),
          ),
          Spacer(),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() =>
      const BoxDecoration(color: Colors.green, boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)]);
}
