import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/ui/views/page_not_found_view.dart';

class PageNotFoundHandler {
  static Handler pageNotFound = Handler(handlerFunc: ((context, parameters) {
    return const PageNotFoundView();
  }));
}
