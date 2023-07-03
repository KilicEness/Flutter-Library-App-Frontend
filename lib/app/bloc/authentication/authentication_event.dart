part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class SignInWithEmail extends AuthenticationEvent {
  final String email;
  final String password;
  const SignInWithEmail({required this.email, required this.password});
}

class SignOut extends AuthenticationEvent {}

class AuthenticationStatusCheck extends AuthenticationEvent {
  final bool isRedirect;
  const AuthenticationStatusCheck({required this.isRedirect});
}
