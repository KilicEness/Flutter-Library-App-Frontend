part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class UsersFetch extends UsersEvent {
  UsersFetch();
}

// class UsersFetchByUser extends UsersEvent {
//   final String ownerId;
//   UsersFetchByUser(
//       {required this.ownerId});
// }