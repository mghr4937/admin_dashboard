import 'package:provider/provider.dart';
import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/views/admin_view.dart';
import 'package:admin_dashboard/ui/views/register_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: ((context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    return authProvider.authStatus == AuthStatus.notAuthenticated ? const LoginView() : const AdminView();
  }));

  static Handler register = Handler(handlerFunc: ((context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    return authProvider.authStatus == AuthStatus.notAuthenticated ? const RegisterView() : const AdminView();
  }));
}
