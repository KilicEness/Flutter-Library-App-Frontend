part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

// ignore: must_be_immutable
class AuthenticationSuccess extends AuthenticationState {
  UserModel user;
  AuthenticationSuccess({required this.user});
}

class AuthenticationLoading extends AuthenticationState {}

// ignore: must_be_immutable
class AuthenticationFailure extends AuthenticationState {
  String message;
  AuthenticationFailure({required this.message});
}

class AuthenticationLogout extends AuthenticationState {}
