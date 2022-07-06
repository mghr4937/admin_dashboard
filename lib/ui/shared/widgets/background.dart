import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var width;
    if (size.width <= 1200) {
      width = size.width * 0.3;
    } else if (size.width <= 1500) {
      width = size.width * 0.5;
    } else {
      width = size.width * 0.6;
    }
    return Container(
      decoration: _buildBackgroundImage(),
      child: Container(
          width: width,
          //constraints: const BoxConstraints(maxWidth: 400),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              // child: Image(
              // image: AssetImage('futim-logo.png'),
              //  width: 400,
              //  ),
            ),
          )),
    );
  }

  BoxDecoration _buildBackgroundImage() {
    return const BoxDecoration(image: DecorationImage(image: AssetImage('assets/background.png'), fit: BoxFit.cover));
  }
}
