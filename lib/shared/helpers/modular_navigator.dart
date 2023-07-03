import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ModularNavigator {
  static void toPush(String path) {
    if (kIsWeb) {
      Modular.to.pushNamed(path);
    } else {
      Modular.to.pushNamed(path);
    }
  }

  static void toPopAndPush(String path) {
    if (kIsWeb) {
      Modular.to.popAndPushNamed(path);
    } else {
      Modular.to.popAndPushNamed(path);
    }
  }

  static void toPop() {
    Modular.to.pop();
  }

  static void toReplace(String path) {
    Modular.to.navigate(path);
  }

  static bool canPop() {
    return Modular.to.canPop();
  }

  static void toPushReplacementNamed(String path) {
    Modular.to.popAndPushNamed(path, forRoot: true);
  }

  static void toPushNamedAndRemoveUntil(String path) {
    Modular.to.pushNamedAndRemoveUntil(path, (p0) => false);
  }
}
