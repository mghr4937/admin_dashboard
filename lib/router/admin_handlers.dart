import 'package:provider/provider.dart';
import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/providers/login_provider.dart';
import 'package:admin_dashboard/ui/views/admin/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/login/register_view.dart';
import 'package:admin_dashboard/ui/views/login/login_view.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: ((context, parameters) {
    final authProvider = Provider.of<LoginProvider>(context!);
    return authProvider.authStatus == AuthStatus.notAuthenticated ? const LoginView() : const DashboardView();
  }));

  static Handler register = Handler(handlerFunc: ((context, parameters) {
    final authProvider = Provider.of<LoginProvider>(context!);
    return authProvider.authStatus == AuthStatus.notAuthenticated ? const RegisterView() : const DashboardView();
  }));
}
