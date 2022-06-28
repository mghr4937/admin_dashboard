import 'package:fluro/fluro.dart';

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

  static void configureRoute() {
    router.define(rootPath,
        handler: AdminHandlers.login, transitionType: TransitionType.fadeIn);
    //auth routes
    router.define(loginPath,
        handler: AdminHandlers.login, transitionType: TransitionType.fadeIn);

    router.define(registerPath,
        handler: AdminHandlers.register, transitionType: TransitionType.fadeIn);
    //router.define(dashboardPath, handler: handler);

    //404
    router.notFoundHandler = PageNotFoundHandler.pageNotFound;
  }
}
