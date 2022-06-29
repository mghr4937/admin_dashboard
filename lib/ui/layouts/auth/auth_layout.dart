import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/background.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ScrollController scollBarController = ScrollController();
    return Scaffold(
        body: Scrollbar(
      controller: scollBarController,
      thumbVisibility: true,
      child: ListView(
        controller: scollBarController,
        physics: const ClampingScrollPhysics(),
        children: [
          (size.width > 1000) ? _DesktopBody(child: child) : _MobileBody(child: child),

          //LinksBar
          const LinksBar()
        ],
      ),
    ));
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.black,
      child: Row(children: [
        // Background
        const Background(),

        //view container
        Container(
          width: 600,
          height: double.infinity,
          color: Colors.black,
          child: Column(children: [
            const SizedBox(height: 20),
            const CustomTitle(),
            const SizedBox(height: 50),
            Expanded(child: child)
          ]),
        )
      ]),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;

  const _MobileBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(height: 20),
        const CustomTitle(),
        SizedBox(
          width: double.infinity,
          height: 420,
          child: child,
        ),
        const SizedBox(
          width: double.infinity,
          height: 400,
          child: Background(),
        )
      ]),
    );
  }
}
