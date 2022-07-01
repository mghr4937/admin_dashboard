import 'package:flutter/widgets.dart';

class SideBarProvider extends ChangeNotifier {
  static late AnimationController menuController;
  static bool isOpen = false;

  String _currentPage = '';

  get currentPage {
    return _currentPage;
  }

  void setCurrentPageUrl(String path) {
    _currentPage = path;
    Future.delayed(const Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }

  static Animation<double> movement =
      Tween<double>(begin: -200, end: 0).animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static Animation<double> opacity =
      Tween<double>(begin: -0, end: 1).animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static void openMenu() {
    isOpen = true;
    menuController.forward();
  }

  static void closeMenu() {
    isOpen = false;
    menuController.reverse();
  }

  static void toggleMenu() {
    (isOpen) ? menuController.forward() : menuController.reverse();
    isOpen = !isOpen;
  }
}
