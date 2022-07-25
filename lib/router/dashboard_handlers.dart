import 'package:admin_dashboard/providers/authentication_provider.dart';
import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/views/admin/categories_view.dart';
import 'package:admin_dashboard/ui/views/admin/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/admin/tournaments_view.dart';
import 'package:admin_dashboard/ui/views/admin/user_view.dart';
import 'package:admin_dashboard/ui/views/admin/users_view.dart';
import 'package:admin_dashboard/ui/views/animation_view.dart';
import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler adminPanel = Handler(handlerFunc: ((context, parameters) {
    final authProvider = Provider.of<AuthenticationProvider>(context!);
    Provider.of<SideBarProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardPath);

    if (authProvider.status == AuthStatus.authenticated) {
      return const DashboardView();
    } else {
      return const LoginView();
    }
  }));

  static Handler icons = Handler(handlerFunc: ((context, parameters) {
    final authProvider = Provider.of<AuthenticationProvider>(context!);
    Provider.of<SideBarProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.iconsPath);

    if (authProvider.status == AuthStatus.authenticated) {
      return const IconsView();
    } else {
      return const LoginView();
    }
  }));

  static Handler categories = Handler(handlerFunc: ((context, parameters) {
    final authProvider = Provider.of<AuthenticationProvider>(context!);
    Provider.of<SideBarProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.categoriesPath);

    if (authProvider.status == AuthStatus.authenticated) {
      return const CategoriesView();
    } else {
      return const LoginView();
    }
  }));

  static Handler tournaments = Handler(handlerFunc: ((context, parameters) {
    final authProvider = Provider.of<AuthenticationProvider>(context!);
    Provider.of<SideBarProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.tournamentsPath);

    if (authProvider.status == AuthStatus.authenticated) {
      return const TournamentsView();
    } else {
      return const LoginView();
    }
  }));

  static Handler user = Handler(handlerFunc: ((context, parameters) {
    final authProvider = Provider.of<AuthenticationProvider>(context!);
    Provider.of<SideBarProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.userPath);

    if (authProvider.status == AuthStatus.authenticated) {
      if (parameters['uid']?.first != null) {
        return UserView(uid: parameters['uid']!.first);
      } else {
        return const UsersView();
      }
    } else {
      return const LoginView();
    }
  }));

  static Handler blank = Handler(handlerFunc: ((context, parameters) {
    final authProvider = Provider.of<AuthenticationProvider>(context!);
    Provider.of<SideBarProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.blankPath);

    if (authProvider.status == AuthStatus.authenticated) {
      return const BlankView();
    } else {
      return const LoginView();
    }
  }));

  static Handler animation = Handler(handlerFunc: ((context, parameters) {
    final authProvider = Provider.of<AuthenticationProvider>(context!);
    Provider.of<SideBarProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.animationPath);

    if (authProvider.status == AuthStatus.authenticated) {
      return const AnimationView();
    } else {
      return const LoginView();
    }
  }));
}
