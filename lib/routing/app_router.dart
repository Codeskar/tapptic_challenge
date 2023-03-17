import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../model/number_model.dart';
import '../pages/list_page.dart';
import '../widgets/number_details.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  transitionsBuilder: TransitionsBuilders.fadeIn,
  routes: <AutoRoute>[
    AutoRoute(
      page: ListPage,
      path: 'numbers',
      initial: true,
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter();

  static PageRouteInfo get mainRoute => const ListRoute();
}
