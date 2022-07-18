import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart'; // new
import 'firebase_options.dart';
//import 'src/authentication.dart';                  // new

import 'package:admin_dashboard/providers/providers.dart';

import '/router/router.dart';
import '/api/cafe_api.dart';
import '/services/local_storage.dart';
import '/services/notifications_service.dart';
import '/services/navigation_service.dart';
import '/ui/layouts/auth_layout.dart';
import '/ui/layouts/dashboard/dashboard_layout.dart';
import '/ui/layouts/splash/splash_layout.dart';

void main() async {
  //BD - local
  await LocalStorage.configurePress();
  //firebasw
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //api
  CafeApi.configure();
  Flurorouter.configureRoute();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(lazy: false, create: (context) => SideBarProvider()),
        ChangeNotifierProvider(create: (context) => CategoriesProvider()),
        ChangeNotifierProvider(create: (context) => UsersProvider()),
        ChangeNotifierProvider(lazy: false, create: (context) => UserFormProvider()),
      ],
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
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationService.messengerKey,
      builder: ((context, child) {
        //print('token: ${LocalStorage.prefs.getString('token')}');
        final authProvider = Provider.of<AuthenticationProvider>(context);
        if (authProvider.status == AuthStatus.authenticating) {
          return const SplashLayout();
        }
        if (authProvider.status == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }
      }),
      theme: ThemeData.light().copyWith(
          scrollbarTheme: const ScrollbarThemeData().copyWith(
              thickness: MaterialStateProperty.all(10),
              thumbColor: MaterialStateProperty.all(Colors.yellow.withOpacity(0.8)))),
    );
  }
}
