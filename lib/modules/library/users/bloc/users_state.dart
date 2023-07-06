part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersSuccess extends UsersState {
  final List<UserModel> users;
  const UsersSuccess({required this.users});
}

class UsersLoading extends UsersState {}

class UsersFailure extends UsersState {
  final String message;
  const UsersFailure({required this.message});
}
