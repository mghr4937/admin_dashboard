import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:flutter/material.dart';

void main() {
  Flurorouter.configureRoute();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Futim - Admin Dashboard',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      builder: ((context, child) {
        return const AuthLayout();
      }),
    );
  }
}
