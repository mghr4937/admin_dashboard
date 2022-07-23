import 'package:admin_dashboard/providers/authentication_provider.dart';
import 'package:admin_dashboard/ui/views/admin/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/login/login_view.dart';
import 'package:admin_dashboard/ui/views/login/register_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class LoginHandlers {
  static Handler login = Handler(handlerFunc: ((context, parameters) {
    final authProvider = Provider.of<AuthenticationProvider>(context!);
    return authProvider.status == AuthStatus.unauthenticated
        ? const LoginView()
        : const DashboardView();
  }));

  static Handler register = Handler(handlerFunc: ((context, parameters) {
    final authProvider = Provider.of<AuthenticationProvider>(context!);
    return authProvider.status == AuthStatus.unauthenticated
        ? const RegisterView()
        : const DashboardView();
  }));
}
