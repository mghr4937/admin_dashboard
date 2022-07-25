import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/login_handlers.dart';
import 'package:admin_dashboard/router/page_not_found_handler.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootPath = '/';

  //Auth router
  static String loginPath = '/auth/login';
  static String registerPath = '/auth/register';

  //dashboard
  static String dashboardPath = '/dashboard';
  static String tournamentsPath = '/dashboard/tournaments';
  static String iconsPath = '/dashboard/icons';
  static String categoriesPath = '/dashboard/categories';
  static String usersPath = '/dashboard/users';
  static String userPath = '/dashboard/users/:uid';
  static String blankPath = '/dashboard/blank';
  static String animationPath = '/dashboard/animation';

  static void configureRoute() {
    router.define(rootPath,
        handler: LoginHandlers.login,
        transitionType: TransitionType.none,
        transitionDuration: const Duration(milliseconds: 100));
    //auth routes
    router.define(loginPath,
        handler: LoginHandlers.login, transitionType: TransitionType.none);
    router.define(registerPath,
        handler: LoginHandlers.register, transitionType: TransitionType.none);
    //dashboard
    router.define(dashboardPath,
        handler: DashboardHandlers.adminPanel,
        transitionType: TransitionType.none);

    router.define(categoriesPath,
        handler: DashboardHandlers.categories,
        transitionType: TransitionType.none,
        transitionDuration: const Duration(milliseconds: 100));

    router.define(tournamentsPath,
        handler: DashboardHandlers.tournaments,
        transitionType: TransitionType.none,
        transitionDuration: const Duration(milliseconds: 100));

    router.define(userPath,
        handler: DashboardHandlers.user,
        transitionType: TransitionType.none,
        transitionDuration: const Duration(milliseconds: 100));

    router.define(blankPath,
        handler: DashboardHandlers.blank,
        transitionType: TransitionType.none,
        transitionDuration: const Duration(milliseconds: 100));

    router.define(animationPath,
        handler: DashboardHandlers.animation,
        transitionType: TransitionType.none,
        transitionDuration: const Duration(milliseconds: 100));

    router.define(iconsPath,
        handler: DashboardHandlers.icons,
        transitionType: TransitionType.none,
        transitionDuration: const Duration(milliseconds: 100));

    //404
    router.notFoundHandler = PageNotFoundHandler.pageNotFound;
  }
}
