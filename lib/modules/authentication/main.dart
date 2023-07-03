import 'package:flutter_modular/flutter_modular.dart';

import './login_page.dart';
import './logout_page.dart';
import './check_page.dart';

class Authentication extends Module {
  @override
  // authentication moudule in routes
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => const CheckPage()),
        ChildRoute('/login', child: (_, args) => const LoginPage()),
        ChildRoute('/logout', child: (_, args) => const LogOutPage()),
      ];
}
