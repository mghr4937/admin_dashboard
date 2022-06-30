import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/page_not_found_handler.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootPath = '/';

  //Auth router
  static String loginPath = '/auth/login';
  static String registerPath = '/auth/register';

  //dashboard
  static String dashboardPath = '/dashboard';
  static String iconsPath = '/dashboard/icons';

  static void configureRoute() {
    router.define(rootPath, handler: AdminHandlers.login, transitionType: TransitionType.fadeIn);
    //auth routes
    router.define(loginPath, handler: AdminHandlers.login, transitionType: TransitionType.fadeIn);

    router.define(registerPath, handler: AdminHandlers.register, transitionType: TransitionType.fadeIn);

    router.define(dashboardPath, handler: DashboardHandlers.adminPanel, transitionType: TransitionType.fadeIn);

    router.define(iconsPath, handler: DashboardHandlers.icons, transitionType: TransitionType.fadeIn);

    //404
    router.notFoundHandler = PageNotFoundHandler.pageNotFound;
  }
}
