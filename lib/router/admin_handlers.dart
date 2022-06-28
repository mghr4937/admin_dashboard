import 'package:admin_dashboard/ui/views/register_view.dart';
import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: ((context, parameters) {
    return const LoginView();
  }));

  static Handler register = Handler(handlerFunc: ((context, parameters) {
    return const RegisterView();
  }));
}
