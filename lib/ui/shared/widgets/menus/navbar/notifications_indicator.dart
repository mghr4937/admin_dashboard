import 'package:flutter/material.dart';

class NotificationsIndicator extends StatelessWidget {
  const NotificationsIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          const Icon(Icons.notifications_none_outlined, color: Colors.black, size: 30),
          Positioned(
            top: 4,
            left: 15,
            child: Container(
              width: 10,
              height: 10,
              decoration: buildBoxDecoration(),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(100));
}
