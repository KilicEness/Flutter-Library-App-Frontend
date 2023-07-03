import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationGuard extends RouteGuard {
  @override
  String? get redirectTo => "/authentication/login";

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    // AuthenticationBloc _authenticationBloc = Modular.get<AuthenticationBloc>();
    //_authenticationBloc.add(AuthenticationStatusCheck());
    // if (_authenticationBloc.state is AuthenticationSuccess) {
    //   return true;
    // }
    // return false;
    var sharedPreferences = await SharedPreferences.getInstance();
    bool isLogin = sharedPreferences.getBool("isLogin") ?? false;
    return isLogin;
  }
}
