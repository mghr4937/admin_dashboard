import 'dart:html';

import 'package:admin_dashboard/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBarAvatar extends StatelessWidget {
  const NavBarAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<AuthenticationProvider>(context).getUser;
    final image = (loggedUser.photoURL == null)
        ? const Image(image: AssetImage('assets/no-photo.png'), width: 35, height: 35)
        : FadeInImage.assetNetwork(
            placeholder: 'assets/loader.gif', image: loggedUser.photoURL!, width: 35, height: 35);
    ImageElement(src: loggedUser.photoURL!, width: 35, height: 35);
    return ClipOval(
      child: SizedBox(
        width: 35,
        height: 35,
        child: image,
      ),
    );
  }
}
