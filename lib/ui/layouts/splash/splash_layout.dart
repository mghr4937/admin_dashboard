import 'package:flutter/material.dart';

class SplashLayout extends StatelessWidget {
  const SplashLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: const [
          CircularProgressIndicator(
            color: Colors.green,
          ),
          SizedBox(
            height: 20,
          ),
          Text('...')
        ],
      )),
    );
  }
}
