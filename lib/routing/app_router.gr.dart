// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    ListRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ListPage(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NumberRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const NumberPage(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          ListRoute.name,
          path: 'numbers',
        ),
        RouteConfig(
          NumberRoute.name,
          path: 'numbers/:name',
        ),
      ];
}

/// generated route for
/// [ListPage]
class ListRoute extends PageRouteInfo<void> {
  const ListRoute()
      : super(
          ListRoute.name,
          path: 'numbers',
        );

  static const String name = 'ListRoute';
}

/// generated route for
/// [NumberPage]
class NumberRoute extends PageRouteInfo<void> {
  const NumberRoute()
      : super(
          NumberRoute.name,
          path: 'numbers/:name',
        );

  static const String name = 'NumberRoute';
}
