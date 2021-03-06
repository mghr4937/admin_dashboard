import 'package:flutter/material.dart';
import '/providers/sidebar_provider.dart';
import '/ui/shared/widgets/menus/navbar/navbar.dart';
import '/ui/shared/widgets/menus/sidebar/sidebar.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;

  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SideBarProvider.menuController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.blueGrey.withOpacity(0.2),
        body: Stack(
          children: [
            Row(
              children: [
                if (size.width >= 700) const SideBar(),
                //
                Expanded(
                  child: Column(
                    children: [
                      //nav bar
                      const NavBar(),

                      //view
                      Expanded(child: widget.child)
                    ],
                  ),
                ),
              ],
            ),
            if (size.width < 700)
              AnimatedBuilder(
                animation: SideBarProvider.menuController,
                builder: (context, _) => Stack(
                  children: [
                    if (SideBarProvider.isOpen)
                      Opacity(
                          opacity: SideBarProvider.opacity.value,
                          child: GestureDetector(
                            onTap: () => SideBarProvider.closeMenu(),
                            child: Container(
                              width: size.width,
                              height: size.height,
                              color: Colors.black12.withOpacity(0.7),
                            ),
                          )),
                    Transform.translate(
                      offset: Offset(SideBarProvider.movement.value, 0),
                      child: const SideBar(),
                    ),
                  ],
                ),
              )
          ],
        ));
  }
}
