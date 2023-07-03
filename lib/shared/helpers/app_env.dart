import 'package:flutter_dotenv/flutter_dotenv.dart';


class AppEnv {
  static String get apiUrl => dotenv.env['API_URL'] ?? 'API URL NOTFOUND.';
  static String get incomingTransfersLD => "INCOMING_TRANSFERS_LD";
  static String get preAcceptLD => "PRE_ACCEPT_LD";
  static String get appVersion =>
      dotenv.env['APP_VERSION'] ?? 'APP VERSION NOTFOUND.';
}
