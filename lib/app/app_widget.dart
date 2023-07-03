import 'dart:ui';

import 'package:library_app/shared/helpers/app_env.dart';
import 'package:library_app/shared/helpers/local_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  final ILocalStorage localStorage;
  AppWidget({Key? key, required this.localStorage}) : super(key: key) {
    localStorage.setData(key: "version", value: AppEnv.appVersion.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: 'Library App',
      builder: asuka.builder,
      theme: ThemeData(
        scrollbarTheme: const ScrollbarThemeData(
          isAlwaysShown: kIsWeb
            // thumbVisibility: MaterialStateProperty.all<bool>(true),
            ),
        primarySwatch: Colors.blueGrey,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
              fontSize: 14, fontFeatures: [FontFeature.proportionalFigures()]),
          subtitle1: TextStyle(
            fontFeatures: [FontFeature.proportionalFigures()],
          ),
        ),
      ),
    );
  }
}
