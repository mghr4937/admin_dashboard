import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: _buildBackgroundImage(),
        child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Image(
                  image: AssetImage('futim-logo.png'),
                  width: 400,
                ),
              ),
            )),
      ),
    );
  }

  BoxDecoration _buildBackgroundImage() {
    return const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('background.png'), fit: BoxFit.cover));
  }
}
