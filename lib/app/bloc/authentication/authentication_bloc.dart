import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:library_app/shared/helpers/modular_navigator.dart';

import '../../services/authentication/i_authentication_service.dart';
import '../../models/user_model.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IAuthenticationService iAuthenticationService;

  AuthenticationBloc({required this.iAuthenticationService})
      : super(AuthenticationInitial()) {
    on<SignInWithEmail>(_onSignInWithEmail);
    on<SignOut>(_onSignOut);
    on<AuthenticationStatusCheck>(_onAuthenticationStatusCheck);
  }

  void _onSignInWithEmail(SignInWithEmail event, emit) async {
    try {
      emit(AuthenticationLoading());
      UserModel user = await iAuthenticationService.signInWitEmail(
          email: event.email, password: event.password);
      emit(AuthenticationSuccess(user: user));
    } catch (e) {
      emit(AuthenticationFailure(message: e.toString()));
    }
  }

  void _onSignOut(event, emit) async {
    await iAuthenticationService.userLogout();
    emit(AuthenticationLogout());
  }

  void _onAuthenticationStatusCheck(
      AuthenticationStatusCheck event, emit) async {
    emit(AuthenticationLoading());
    try {
      bool isLoginStatus = await iAuthenticationService.userLoginStatus();
      if (isLoginStatus == true) {
        UserModel user = await iAuthenticationService.getUserData();
        emit(AuthenticationSuccess(user: user));
        if (event.isRedirect) {
          await Future.delayed(const Duration(seconds: 1));
          ModularNavigator.toReplace('/library/dashboard');
        }
      } else {
        emit(AuthenticationLogout());
        await Future.delayed(const Duration(seconds: 1));
        ModularNavigator.toReplace('/login');
      }
    } catch (e) {
      emit(AuthenticationLogout());
    }
  }
}
