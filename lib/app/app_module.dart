import 'package:flutter_modular/flutter_modular.dart';

//Guards
import '../guards/authentication_guard.dart';
import '../guards/navigation_path_guard.dart';

//Modules
// import 'package:library_app/modules/splash/main.dart';
import '../modules/authentication/main.dart';
import '../modules/library/main.dart';
//SP Storeage
import '../shared/helpers/local_storage.dart';

//Network
import '../shared/helpers/networking.dart';

//App Navigation
import './bloc/app_navigation/app_navigation_bloc.dart';

//Authentication
import './bloc/authentication/authentication_bloc.dart';
import './services/authentication/authentication_service.dart';

class AppModule extends Module {
  AppModule();
  @override
  List<Bind<Object>> get binds => [
        Bind(
            (i) => AuthenticationBloc(
                iAuthenticationService: AuthenticationService(
                    network: DioNetwork(), localStorage: SPStorage()))
              ..add(const AuthenticationStatusCheck(isRedirect: false)),
            isLazy: true,
            isSingleton: true),
        Bind((i) => AppNavigationBloc(), isLazy: true, isSingleton: true),
      ];

  @override
  // app module in routes
  List<ModularRoute> get routes => [
        // ModuleRoute(Modular.initialRoute,
        //     module: Splash(redirectPath: '/authentication/check'),
        //     transition: TransitionType.fadeIn),
        ModuleRoute(Modular.initialRoute,
            module: Authentication(), transition: TransitionType.noTransition),
        ModuleRoute('/library',
            module: Library(),
            transition: TransitionType.noTransition,
            guards: [NavigationPathGuard(), AuthenticationGuard()]),
      ];
}
