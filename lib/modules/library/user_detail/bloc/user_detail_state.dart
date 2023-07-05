part of 'user_detail_bloc.dart';

abstract class UserDetailState extends Equatable {
  const UserDetailState();

  @override
  List<Object> get props => [];
}

class UserDetailInitial extends UserDetailState {}

class UserDetailSuccess extends UserDetailState {
  final UserModel userDetail;
  const UserDetailSuccess(
      {required this.userDetail});
}

class UserDetailLoading extends UserDetailState {}

class UserDetailFail extends UserDetailState {
  final String errorMessage;
  const UserDetailFail({required this.errorMessage});
}
