import 'dart:async';

import './/app/bloc/app_navigation/app_navigation_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NavigationPathGuard extends RouteGuard {
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route)async {
    AppNavigationBloc bloc = Modular.get<AppNavigationBloc>();
    bloc.add(ChangePath(path: path));
    return true;
  }
}
