import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tapptic_challenge/pages/list_page.dart';

void main() async {
  setupLogger();

  await Hive.initFlutter();
  await Hive.openBox('myBox');

  EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListPage(),
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
