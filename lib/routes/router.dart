import 'package:auto_route/auto_route.dart';
import 'package:flutter_rest_api_playground/view/users/users_list_page.dart';

import '../main.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MyHomePage, path: '/', initial: true),
    AutoRoute(page: UsersListPage, path: '/users'),
  ],
)
class $AppRouter {}
