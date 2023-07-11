part of 'my_profile_bloc.dart';

abstract class MyProfileState extends Equatable {
  const MyProfileState();
  
  @override
  List<Object> get props => [];
}

class MyProfileInitial extends MyProfileState {}

class MyProfileSuccess extends MyProfileState {
  final UserModel user;
  const MyProfileSuccess({required this.user});
}

class MyProfileLoading extends MyProfileState {}

class MyProfileFail extends MyProfileState {
  final String errorMessage;
  const MyProfileFail({required this.errorMessage});
}
