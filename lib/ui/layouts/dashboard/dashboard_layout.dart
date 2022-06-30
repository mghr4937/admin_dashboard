import 'package:admin_dashboard/ui/shared/widgets/menus/nav_bar.dart';
import 'package:admin_dashboard/ui/shared/widgets/menus/side_bar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.withOpacity(0.2),
        body: Row(
          children: [
            /// > 700px
            const SideBar(),
            Expanded(
              child: Column(
                children: [
                  //nav bar
                  const NavBar(),

                  //view
                  Expanded(child: child)
                ],
              ),
            ),
          ],
        ));
  }
}
