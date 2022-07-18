import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
        image: AssetImage('football-soccer.gif'),
        height: 100,
      ),
    );
  }
}
