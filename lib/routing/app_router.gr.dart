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
      final args = routeData.argsAs<NumberRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: NumberPage(
          key: args.key,
          number: args.number,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'numbers',
          fullMatch: true,
        ),
        RouteConfig(
          ListRoute.name,
          path: 'numbers',
        ),
        RouteConfig(
          NumberRoute.name,
          path: 'number/:name',
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
class NumberRoute extends PageRouteInfo<NumberRouteArgs> {
  NumberRoute({
    Key? key,
    required NumberModel number,
  }) : super(
          NumberRoute.name,
          path: 'number/:name',
          args: NumberRouteArgs(
            key: key,
            number: number,
          ),
        );

  static const String name = 'NumberRoute';
}

class NumberRouteArgs {
  const NumberRouteArgs({
    this.key,
    required this.number,
  });

  final Key? key;

  final NumberModel number;

  @override
  String toString() {
    return 'NumberRouteArgs{key: $key, number: $number}';
  }
}
