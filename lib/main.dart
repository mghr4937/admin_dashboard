import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  Flurorouter.configureRoute();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: const MyApp(),
    );
  }
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
        return AuthLayout(child: child!);
      }),
      theme: ThemeData.dark().copyWith(
          scrollbarTheme: const ScrollbarThemeData().copyWith(
              thickness: MaterialStateProperty.all(10),
              thumbColor: MaterialStateProperty.all(Colors.yellow.withOpacity(0.8)))),
    );
  }
}
