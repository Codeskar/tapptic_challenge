import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tapptic_challenge/generated/codegen_loader.g.dart';

import 'routing/app_router.dart';

const kDefaultLocale = Locale('en');

void main() async {
  setupLogger();

  await Hive.initFlutter();
  await Hive.openBox('myBox');

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
      ],
      path: 'translations',
      fallbackLocale: kDefaultLocale,
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      useFallbackTranslations: kDebugMode == false,
      child: MyApp(AppRouter()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp(
    this._appRouter, {
    this.initialDynamicLink,
    super.key,
  });

  final AppRouter _appRouter;
  final String? initialDynamicLink;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'App',
      routerDelegate: _appRouter.delegate(initialDeepLink: initialDynamicLink),
      routeInformationParser: _RouteParser(_appRouter),
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      builder: (ctx, child) {
        return ResponsiveWrapper.builder(
          child,
          breakpoints: const [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ],
          debugLog: kDebugMode,
        );
      },
    );
  }
}

void setupLogger() {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(),
    logOptions: const LogOptions(
      kDebugMode ? LogLevel.all : LogLevel.error,
      stackTraceLevel: kDebugMode ? LogLevel.error : LogLevel.off,
    ),
    hierarchicalLogging: false,
  );
}

class _RouteParser extends DefaultRouteParser with UiLoggy {
  _RouteParser(this.appRouter, {bool includePrefixMatches = false})
      : super(appRouter.matcher, includePrefixMatches: includePrefixMatches);

  final AppRouter appRouter;

  @override
  Future<UrlState> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');
    loggy.debug('parseRouteInformation: $uri');
    return super.parseRouteInformation(routeInformation);
  }
}
