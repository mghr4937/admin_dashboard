import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';

class DashboardHandlers {
  static Handler adminPanel = Handler(handlerFunc: ((context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideBarProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.dashboardPath);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const DashboardView();
    } else {
      return const LoginView();
    }
  }));

  static Handler icons = Handler(handlerFunc: ((context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideBarProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.iconsPath);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const IconsView();
    } else {
      return const LoginView();
    }
  }));

  static Handler blank = Handler(handlerFunc: ((context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideBarProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.blankPath);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const BlankView();
    } else {
      return const LoginView();
    }
  }));
}
