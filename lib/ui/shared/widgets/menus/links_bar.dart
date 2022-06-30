//
import 'package:flutter/material.dart';
//
import 'package:admin_dashboard/ui/shared/widgets/buttons/link_text.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black,
      height: (size.width > 1000) ? size.height * 0.05 : null,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(text: 'Quienes Somos', onPress: () => print('About')),
          const LinkText(text: 'Partners'),
          const LinkText(text: 'Contacto'),
          const LinkText(text: '© 2022 Ipolitis Corporation.')
        ],
      ),
    );
  }
}
