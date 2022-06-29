import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:provider/provider.dart';
import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/views/admin_view.dart';

class DashboardHandlers {
  static Handler adminPanel = Handler(handlerFunc: ((context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    return authProvider.authStatus == AuthStatus.authenticated ? const AdminView() : const LoginView();
  }));
}
