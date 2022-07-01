import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/ui/views/page_not_found_view.dart';
import 'package:provider/provider.dart';

class PageNotFoundHandler {
  static Handler pageNotFound = Handler(handlerFunc: ((context, parameters) {
    Provider.of<SideBarProvider>(context!, listen: false).setCurrentPageUrl('/404');
    return const PageNotFoundView();
  }));
}
