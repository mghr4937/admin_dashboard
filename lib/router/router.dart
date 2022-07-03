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
  static String blankPath = '/dashboard/blank';

  static void configureRoute() {
    router.define(rootPath,
        handler: AdminHandlers.login,
        transitionType: TransitionType.none,
        transitionDuration: Duration(milliseconds: 100));
    //auth routes
    router.define(loginPath, handler: AdminHandlers.login, transitionType: TransitionType.none);

    router.define(registerPath, handler: AdminHandlers.register, transitionType: TransitionType.none);

    router.define(dashboardPath, handler: DashboardHandlers.adminPanel, transitionType: TransitionType.none);

    router.define(blankPath,
        handler: DashboardHandlers.blank,
        transitionType: TransitionType.none,
        transitionDuration: Duration(milliseconds: 100));

    router.define(iconsPath,
        handler: DashboardHandlers.icons,
        transitionType: TransitionType.none,
        transitionDuration: Duration(milliseconds: 100));

    //404
    router.notFoundHandler = PageNotFoundHandler.pageNotFound;
  }
}
