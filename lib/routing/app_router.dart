import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../pages/list_page.dart';
import '../pages/number_page.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  transitionsBuilder: TransitionsBuilders.fadeIn,
  routes: <AutoRoute>[
    AutoRoute(
      page: ListPage,
      path: 'numbers',
    ),
    AutoRoute(
      page: NumberPage,
      path: 'numbers/:name',
    )
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter();

  static PageRouteInfo get mainRoute => const ListRoute();
}
