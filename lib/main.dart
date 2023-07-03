import 'package:library_app/app/app_module.dart';
import 'package:library_app/app/app_widget.dart';
import 'package:library_app/shared/helpers/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  const String appEnv =  String.fromEnvironment('APP_ENV');

  String fileName = "";

  switch (appEnv) {
    case "prod":
      fileName = "./config/.env.prod";
      break;
    case "dev":
      fileName = "./config/.env.dev";
      break;
    case "uat":
      fileName = "./config/.env.uat";
      break;
    default:
      fileName = "./config/.env.dev";
      break;
  }

  await dotenv.load(fileName: fileName);

  runApp(ModularApp(
      module: AppModule(),
      child: AppWidget(
        localStorage: SPStorage(),
      )));
}
