import 'package:flutter/widgets.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static navigateTo(String path) {
    return navigatorKey.currentState!.pushNamed(path);
  }

  static replaceTo(String path) {
    return navigatorKey.currentState!.pushReplacementNamed(path);
  }
}
