part of 'edit_profile_bloc.dart';

abstract class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {
  final UserModel user;
  const EditProfileSuccess({required this.user});
}

class EditProfileFailure extends EditProfileState {
  final String message;
  const EditProfileFailure({required this.message});
}
