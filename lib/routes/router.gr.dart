// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../main.dart' as _i1;
import '../view/users/users_detail_page.dart' as _i3;
import '../view/users/users_list_page.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MyHomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MyHomePage());
    },
    UsersListRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.UsersListPage());
    },
    UserDetailRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<UserDetailRouteArgs>(
          orElse: () =>
              UserDetailRouteArgs(userId: pathParams.getString('id')));
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.UserDetailPage(key: args.key, userId: args.userId));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(MyHomeRoute.name, path: '/'),
        _i4.RouteConfig(UsersListRoute.name, path: '/users'),
        _i4.RouteConfig(UserDetailRoute.name, path: '/user/:id')
      ];
}

/// generated route for [_i1.MyHomePage]
class MyHomeRoute extends _i4.PageRouteInfo<void> {
  const MyHomeRoute() : super(name, path: '/');

  static const String name = 'MyHomeRoute';
}

/// generated route for [_i2.UsersListPage]
class UsersListRoute extends _i4.PageRouteInfo<void> {
  const UsersListRoute() : super(name, path: '/users');

  static const String name = 'UsersListRoute';
}

/// generated route for [_i3.UserDetailPage]
class UserDetailRoute extends _i4.PageRouteInfo<UserDetailRouteArgs> {
  UserDetailRoute({_i5.Key? key, required String userId})
      : super(name,
            path: '/user/:id',
            args: UserDetailRouteArgs(key: key, userId: userId),
            rawPathParams: {'id': userId});

  static const String name = 'UserDetailRoute';
}

class UserDetailRouteArgs {
  const UserDetailRouteArgs({this.key, required this.userId});

  final _i5.Key? key;

  final String userId;
}
